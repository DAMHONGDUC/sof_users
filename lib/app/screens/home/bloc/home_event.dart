part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeStartEvent extends HomeEvent {}

class GetListSofEvent extends HomeEvent {}

class ToggleBookmarkEvent extends HomeEvent {
  final UserModel user;

  ToggleBookmarkEvent({required this.user});
}

class CombineWithBookmarkEvent extends HomeEvent {}
