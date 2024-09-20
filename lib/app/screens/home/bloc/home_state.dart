part of 'home_bloc.dart';

class Data {
  final List<UserModel> listSofUser;
  final List<UserModel> listBookmarks;
  final bool hasMore;
  final PaginationRequest request;
  final String? error;

  const Data(
      {required this.listSofUser,
      required this.request,
      required this.listBookmarks,
      required this.hasMore,
      this.error});

  Data copyWith(
      {List<UserModel>? listSofUser,
      List<UserModel>? listBookmarks,
      bool? hasMore,
      PaginationRequest? request,
      String? error}) {
    return Data(
        listSofUser: listSofUser.isNotNullAndNotEmpty
            ? List.from(listSofUser!)
            : this.listSofUser,
        hasMore: hasMore ?? this.hasMore,
        request: request ?? this.request,
        listBookmarks: listBookmarks ?? this.listBookmarks,
        error: error ?? this.error);
  }

  factory Data.init() {
    return Data(
        listSofUser: [],
        listBookmarks: [],
        request: PaginationRequest.init(),
        hasMore: true,
        error: null);
  }
}

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

final class HomeError extends HomeState {
  HomeError({required super.data});
}

final class GetDataSuccess extends HomeState {
  GetDataSuccess({required super.data});
}

// bookmark
final class HandleBookmarkLoading extends HomeState {
  HandleBookmarkLoading({required super.data});
}

final class CombineBookmarkSuccess extends HomeState {
  CombineBookmarkSuccess({required super.data});
}

// refresh
final class RefreshLoading extends HomeState {
  RefreshLoading({required super.data});
}

// loadmore

final class LoadMoreLoading extends HomeState {
  LoadMoreLoading({required super.data});
}
