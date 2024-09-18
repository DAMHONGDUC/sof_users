import 'package:sof_users/data/repositories/sof_repository_impl.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/response/sof_response.dart';

class GetSofUserUC {
  GetSofUserUC({
    required this.repository,
  });

  final SofRepositoryImpl repository;

  Future<SofResponse<List<UserModel>>?> call(
      {Map<String, dynamic>? params}) async {
    final response = await repository.getListSOFUser(params: params);

    return SofResponse(
        items: response?.items?.map((e) => e.toDomain()).toList(),
        hasMore: response?.hasMore);
  }
}
