part of 'user_detail_bloc.dart';

sealed class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object> get props => [];
}

final class UserDetailInitial extends UserDetailState {}
