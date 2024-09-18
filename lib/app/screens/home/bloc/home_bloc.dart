import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/request/get_sof_users_request.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSofUserUC getSofUserUC;

  HomeBloc({required this.getSofUserUC}) : super(HomeInitial()) {
    on<HomeStartEvent>(_onHomeStartEvent);
    on<GetListSofEvent>(_onGetListSofEvent);
  }

  _onHomeStartEvent(HomeStartEvent event, Emitter<HomeState> emit) {
    emit(HomeInitial());
  }

  _onGetListSofEvent(GetListSofEvent event, Emitter<HomeState> emit) async {
    try {
      if (!event.isFirstFetch) {
        emit(GetListSofBottomLoading());
      }

      final res =
          await getSofUserUC.call(params: state.data.request.toParams());

      emit(GetListSofSuccess(
          data: state.data.copyWith(
              listSofUser: res?.items,
              hasMore: res?.hasMore,
              request: state.data.request.copyWith(
                  page: (res?.hasMore ?? false)
                      ? state.data.request.page + 1
                      : null))));
    } catch (e) {
      emit(GetListSofSuccess(data: state.data.copyWith(error: e.toString())));
    }
  }
}
