import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc() : super(UserDetailInitial()) {
    on<UserDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
