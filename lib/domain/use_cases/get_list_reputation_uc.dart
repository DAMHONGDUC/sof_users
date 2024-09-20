import 'package:sof_users/data/repositories/sof_repository_impl.dart';
import 'package:sof_users/domain/model/reputation_model.dart';
import 'package:sof_users/domain/response/reputation_response.dart';

class GetListReputationUC {
  GetListReputationUC({
    required this.repository,
  });

  final SofRepositoryImpl repository;

  Future<ReputationResponse<List<ReputationModel>>?> call(
      {required String userId, Map<String, dynamic>? params}) async {
    final response =
        await repository.getListReputation(params: params, userId: userId);

    return ReputationResponse(
        items: response?.items?.map((e) => e.toDomain()).toList(),
        hasMore: response?.hasMore);
  }
}
