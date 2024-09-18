import 'package:sof_users/data/repository/sof_user_repository.dart';
import 'package:sof_users/domain/model/user_model.dart';

class GetSofUserUC {
  GetSofUserUC({
    required this.repository,
  });

  final SofUserRepository repository;

  Future<List<UserModel>> call({Map<String, dynamic>? params}) async {
    final listUserEntity = await repository.getListSOFUser(params: params);

    if (listUserEntity?.data?.isNotEmpty ?? false) {
      return listUserEntity!.data!.map((e) => e.toDomain()).toList();
    }

    return [];
  }
}
