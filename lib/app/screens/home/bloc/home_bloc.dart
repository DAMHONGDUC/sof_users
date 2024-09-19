import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/app/utils/log.dart';
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
    } catch (e) {
      emit(GetListSofError(data: state.data.copyWith(error: e.toString())));
      Log.e("_onGetListSofEvent", e);
    }
  }
}
