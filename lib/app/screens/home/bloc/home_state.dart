part of 'home_bloc.dart';

class Data {
  final List<UserModel> listSofUser;
  final bool hasMore;
  final GetSofUsersRequest request;
  final String? error;

  const Data(
      {required this.listSofUser,
      required this.request,
      required this.hasMore,
      this.error});

  Data copyWith(
      {List<UserModel>? listSofUser,
      bool? hasMore,
      GetSofUsersRequest? request,
      String? error}) {
    return Data(
        listSofUser: listSofUser.isNotNullAndNotEmpty
            ? List.from(listSofUser!)
            : this.listSofUser,
        hasMore: hasMore ?? this.hasMore,
        request: request ?? this.request,
        error: error ?? this.error);
  }

  factory Data.init() {
    return Data(
        listSofUser: [],
        request: GetSofUsersRequest.init(),
        hasMore: true,
        error: null);
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

final class GetListSofGlobalLoading extends HomeState {
  GetListSofGlobalLoading({required super.data});
}

final class GetListSofSuccess extends HomeState {
  GetListSofSuccess({required super.data});
}

final class GetListSofError extends HomeState {
  GetListSofError({required super.data});
}

final class BookmarkUserLoaing extends HomeState {
  BookmarkUserLoaing({required super.data});
}
