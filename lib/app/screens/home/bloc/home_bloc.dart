import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/request/get_sof_users_request.dart';
import 'package:sof_users/domain/use_cases/toggle_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_list_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:equatable/equatable.dart';

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
    on<GetListSofEvent>(_onGetListSofEvent);
    on<ToggleBookmarkEvent>(_onToggleBookmarkEvent);
    on<CombineWithBookmarkEvent>(_onCombineWithBookmarkEvent);
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
      emit(GetListSofError(data: state.data.copyWith(error: err.toString())));
    }
  }

  _onToggleBookmarkEvent(
      ToggleBookmarkEvent event, Emitter<HomeState> emit) async {
    emit(HandleBookmarkLoading(data: state.data));

    try {
      await toggleBookmarkUC.call(user: event.user);

      add(CombineWithBookmarkEvent());
    } catch (err) {
      emit(GetListSofError(data: state.data.copyWith(error: err.toString())));
    }
  }

  _onGetListSofEvent(GetListSofEvent event, Emitter<HomeState> emit) async {
    if (state is GetListSofGlobalLoading) {
      return;
    }

    // if has more
    emit(GetListSofGlobalLoading(data: state.data));
    try {
      GetSofUsersRequest newRequest =
          state.data.request.copyWith(page: state.data.request.page + 1);

      final res = await getSofUserUC.call(params: newRequest.toParams());

      emit(GetListSofSuccess(
          data: state.data.copyWith(
              listSofUser: List.from(state.data.listSofUser)
                ..addAll(res?.items ?? []),
              hasMore: res?.hasMore,
              request: newRequest)));

      add(CombineWithBookmarkEvent());
    } catch (err) {
      emit(GetListSofError(data: state.data.copyWith(error: err.toString())));
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
}
