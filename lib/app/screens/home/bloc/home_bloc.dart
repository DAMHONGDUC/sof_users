import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:equatable/equatable.dart';
import 'package:sof_users/app/utils/log.dart';

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
    emit(GetListSofLoading());

    final res = await getSofUserUC.call(params: {
      "page": event.page,
      "pagesize": event.pageSize,
      "site": event.site
    });

    Log.d(res?.items?.length);
  }
}
