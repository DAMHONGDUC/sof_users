import 'package:sof_users/data/repository/sof_user_repository.dart';
import 'package:sof_users/domain/response/base_response.dart';

class SofUserUC {
  SofUserUC({
    required this.repository,
  });

  final SofUserRepository repository;

  Future<BaseResponse> getListSOFUser({Map<String, dynamic>? params}) async {
    final entityResponse = await repository.getListSOFUser(params: params);

    return BaseResponse(
        items: entityResponse?.items?.map((e) => e.toDomain()).toList(),
        hasMore: entityResponse?.hasMore);
  }
}
