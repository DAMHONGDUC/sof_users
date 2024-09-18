part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeStartEvent extends HomeEvent {}

class GetListSofEvent extends HomeEvent {
  final int page;
  final int pageSize;
  final String site;

  GetListSofEvent(
      {required this.page, required this.pageSize, required this.site});
}
