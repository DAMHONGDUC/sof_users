part of 'user_detail_bloc.dart';

class Data {
  final List<ReputationModel> listReputation;

  final bool hasMore;
  final PaginationRequest request;
  final String? error;

  const Data(
      {required this.listReputation,
      required this.request,
      required this.hasMore,
      this.error});

  Data copyWith(
      {List<ReputationModel>? listReputation,
      bool? hasMore,
      PaginationRequest? request,
      String? error}) {
    return Data(
        listReputation: listReputation.isNotNullAndNotEmpty
            ? List.from(listReputation!)
            : this.listReputation,
        hasMore: hasMore ?? this.hasMore,
        request: request ?? this.request,
        error: error ?? this.error);
  }

  factory Data.init() {
    return Data(
        listReputation: [],
        request: PaginationRequest.init(),
        hasMore: true,
        error: null);
  }
}

sealed class UserDetailState extends Equatable {
  final Data data;

  const UserDetailState({
    required this.data,
  });

  @override
  List<Object> get props => [];
}

final class UserDetailInitial extends UserDetailState {
  UserDetailInitial() : super(data: Data.init());
}

final class GetUserDetailError extends UserDetailState {
  GetUserDetailError({required super.data});
}

final class GetUserDetailSuccess extends UserDetailState {
  GetUserDetailSuccess({required super.data});
}

final class GetUserDetailLoading extends UserDetailState {
  GetUserDetailLoading() : super(data: Data.init());
}
