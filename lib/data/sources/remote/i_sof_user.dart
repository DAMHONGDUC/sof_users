import 'package:sof_users/data/data_sources/remote/entity/user_entity.dart';
import 'package:sof_users/data/data_sources/remote/response/base_response_entity.dart';

abstract class ISofUser {
  Future<BaseResponseEntity<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params});
}
