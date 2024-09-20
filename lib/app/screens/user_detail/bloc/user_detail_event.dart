part of 'user_detail_bloc.dart';

sealed class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object> get props => [];
}

class GetUserDetailEvent extends UserDetailEvent {}
