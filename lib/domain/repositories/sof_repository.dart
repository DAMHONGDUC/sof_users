import 'package:sof_users/core/network/base_response/base_response.dart';
import 'package:sof_users/data/source/remote/entity/user_entity.dart';

abstract class SofRepository {
  Future<BaseResponse<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params});
}
