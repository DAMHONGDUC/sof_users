import 'package:sof_users/core/network/base_response/base_response.dart';
import 'package:sof_users/data/data_sources/remote/entity/user_entity.dart';

abstract class ISofUser {
  Future<BaseResponse<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params});
}
