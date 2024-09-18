part of 'home_bloc.dart';

class Data {
  final List<UserModel> listSofUser;

  const Data({
    required this.listSofUser,
  });

  Data copyWith({
    List<UserModel>? listSofUser,
  }) {
    return Data(
      listSofUser: listSofUser ?? this.listSofUser,
    );
  }

  factory Data.init() {
    return Data(
      listSofUser: [],
    );
  }
}

@immutable
sealed class HomeState extends Equatable {
  final Data data;

  const HomeState({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(data: Data.init());
}

final class GetListSofLoading extends HomeState {
  GetListSofLoading() : super(data: Data.init());
}

final class GetListSofSuccess extends HomeState {
  GetListSofSuccess({required super.data});
}
