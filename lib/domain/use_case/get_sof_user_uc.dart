import 'package:sof_users/data/repository/sof_user_repository.dart';
import 'package:sof_users/domain/response/base_response.dart';

class GetSofUserUC {
  GetSofUserUC({
    required this.repository,
  });

  final SofUserRepository repository;

  Future<BaseResponse> call({Map<String, dynamic>? params}) async {
    final entityResponse = await repository.getListSOFUser(params: params);

    return BaseResponse(
        items: entityResponse?.items?.map((e) => e.toDomain()).toList(),
        hasMore: entityResponse?.hasMore);
  }
}
