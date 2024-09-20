part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

// class HomeStartEvent extends HomeEvent {}

// class GetListSofEvent extends HomeEvent {}

// bookmark
class ToggleBookmarkEvent extends HomeEvent {
  final UserModel user;

  ToggleBookmarkEvent({required this.user});
}

class CombineWithBookmarkEvent extends HomeEvent {}

// refresh
class RefreshEvent extends HomeEvent {}

// load more
class LoadMoreEvent extends HomeEvent {}
