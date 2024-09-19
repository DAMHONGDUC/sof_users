import 'package:hive/hive.dart';
import 'package:sof_users/domain/model/user_model.dart';

part 'db_bookmark_user.g.dart';

@HiveType(typeId: 0)
class DBBookmarkUser extends HiveObject {
  @HiveField(0)
  int id = 0;

  @HiveField(1)
  String? profileImage = "";

  @HiveField(2)
  String? location = "";

  @HiveField(3)
  int? reputation = 0;

  @HiveField(4)
  String? displayName = "";

  UserModel toDomain() => UserModel(
      id: id,
      displayName: displayName,
      profileImage: profileImage,
      location: location,
      reputation: reputation);
}
