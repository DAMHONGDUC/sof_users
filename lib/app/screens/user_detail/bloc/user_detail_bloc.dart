import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/domain/model/reputation_model.dart';
import 'package:sof_users/domain/request/pagination_request.dart';
import 'package:sof_users/domain/use_cases/get_list_reputation_uc.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final GetListReputationUC getListReputationUC;

  UserDetailBloc({
    required this.getListReputationUC,
  }) : super(UserDetailInitial()) {
    on<GetUserDetailEvent>(_onGetUserDetailEvent);
  }

  _onGetUserDetailEvent(
      GetUserDetailEvent event, Emitter<UserDetailState> emit) async {
    emit(GetUserDetailLoading());

    try {
      final newRequest =
          state.data.request.copyWith(page: state.data.request.page + 1);
      final res = await getListReputationUC.call(
          userId: event.userId, params: newRequest.toParams());

      emit(GetUserDetailSuccess(
          data: state.data.copyWith(
              hasMore: res?.hasMore,
              listReputation: res?.items,
              request: newRequest)));
    } catch (err) {
      emit(
          GetUserDetailError(data: state.data.copyWith(error: err.toString())));
    }
  }
}
