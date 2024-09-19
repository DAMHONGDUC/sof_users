import 'package:hive/hive.dart';

part 'db_bookmark_user.g.dart';

@HiveType(typeId: 0)
class DBBookmarkUser extends HiveObject {
  @HiveField(0)
  final String? displayName = "";

  @HiveField(1)
  final String? profileImage = "";

  @HiveField(2)
  final String? location = "";

  @HiveField(3)
  final int? reputation = 0;
}
