part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeStartEvent extends HomeEvent {}

class GetListSofEvent extends HomeEvent {}
