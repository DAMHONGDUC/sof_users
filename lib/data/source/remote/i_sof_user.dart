import 'package:sof_users/data/source/remote/entity/user_entity.dart';
import 'package:sof_users/data/source/remote/response/entity_response.dart';

abstract class ISofUser {
  Future<EntityResponse<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params});
}
