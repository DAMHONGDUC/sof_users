import 'package:bloc/bloc.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/request/pagination_request.dart';
import 'package:sof_users/domain/use_cases/toggle_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_list_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSofUserUC getSofUserUC;
  final GetListBookmarkUC getListBookmarkUC;
  final ToggleBookmarkUC toggleBookmarkUC;

  HomeBloc({
    required this.getSofUserUC,
    required this.getListBookmarkUC,
    required this.toggleBookmarkUC,
  }) : super(HomeInitial()) {
    // bookmark
    on<ToggleBookmarkEvent>(_onToggleBookmarkEvent);
    on<CombineWithBookmarkEvent>(_onCombineWithBookmarkEvent);

    // refresh
    on<RefreshEvent>(_onRefreshEvent);

    // load more
    on<LoadMoreEvent>(
      _onLoadMoreEvent,
      transformer: droppable(), // ignore if already call load more
    );
  }

  // bookmark
  _onToggleBookmarkEvent(
      ToggleBookmarkEvent event, Emitter<HomeState> emit) async {
    emit(HandleBookmarkLoading(data: state.data));

    try {
      final status = await toggleBookmarkUC.call(user: event.user);
      if (status) {
        add(CombineWithBookmarkEvent());
      } else {
        emit(HomeError(data: state.data.copyWith(error: "Bookmark failed")));
      }
    } catch (err) {
      emit(HomeError(data: state.data.copyWith(error: err.toString())));
    }
  }

  _onCombineWithBookmarkEvent(
      CombineWithBookmarkEvent event, Emitter<HomeState> emit) async {
    emit(HandleBookmarkLoading(data: state.data));

    try {
      final listBookmarkUsers = await getListBookmarkUC.call();

      emit(CombineBookmarkSuccess(
          data: state.data.copyWith(
        listSofUser: _combineWithBookmark(
            listUsers: state.data.listSofUser,
            listBookmarks: listBookmarkUsers),
        listBookmarks: listBookmarkUsers,
      )));
    } catch (err) {
      emit(HomeError(data: state.data.copyWith(error: err.toString())));
    }
  }

  // refresh
  _onRefreshEvent(RefreshEvent event, Emitter<HomeState> emit) async {
    emit(RefreshLoading(data: state.data));
    try {
      await _onFetchDataAndCombineBookmark(
          state: state,
          emit: emit,
          isRefresh: true,
          request: state.data.request);
    } catch (err) {
      emit(HomeError(data: state.data.copyWith(error: err.toString())));
    }
  }

  // load more
  _onLoadMoreEvent(LoadMoreEvent event, Emitter<HomeState> emit) async {
    if (!state.data.hasMore || state is LoadMoreLoading) {
      return;
    }

    // if has more
    emit(LoadMoreLoading(data: state.data));
    try {
      await _onFetchDataAndCombineBookmark(
          state: state, emit: emit, request: state.data.request);
    } catch (err) {
      emit(HomeError(data: state.data.copyWith(error: err.toString())));
    }
  }

  List<UserModel> _combineWithBookmark(
      {required List<UserModel> listUsers,
      required List<UserModel> listBookmarks}) {
    final bookmarkIds = listBookmarks.map((user) => user.id).toSet();

    return listUsers.map((user) {
      return user.copyWith(
        isBookmark: bookmarkIds.contains(user.id),
      );
    }).toList();
  }

  Future<void> _onFetchDataAndCombineBookmark(
      {required HomeState state,
      required Emitter<HomeState> emit,
      bool isRefresh = false,
      required PaginationRequest request}) async {
    final newRequest = request.copyWith(page: isRefresh ? 1 : request.page + 1);

    final res = await getSofUserUC.call(params: newRequest.toParams());

    emit(GetDataSuccess(
        data: state.data.copyWith(
            listSofUser: isRefresh
                ? res?.items
                : (List.from(state.data.listSofUser)..addAll(res?.items ?? [])),
            hasMore: res?.hasMore,
            request: newRequest)));

    add(CombineWithBookmarkEvent());
  }
}
