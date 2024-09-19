import 'package:hive_flutter/hive_flutter.dart';
import 'package:sof_users/core/constants/constants.dart';
import 'package:sof_users/data/source/local/entity/db_bookmark_user.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  @override
  Future<bool> addBookmark({required UserModel user}) async {
    try {
      await Hive.openBox<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);

      DBBookmarkUser dbBookmarkUser = DBBookmarkUser()
        ..displayName = user.displayName
        ..profileImage = user.profileImage
        ..location = user.location
        ..reputation = user.reputation
        ..id = user.id;

      await Hive.box<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER)
          .add(dbBookmarkUser);
      return true;
    } catch (err) {}

    return false;
  }

  @override
  Future<List<DBBookmarkUser>> getListBookmark() async {
    try {
      await Hive.openBox<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);

      final box = Hive.box<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);
      return box.values.toList();
    } catch (err) {}

    return [];
  }

  @override
  Future<bool> deleteBookmark({required String userId}) async {
    final box =
        await Hive.openBox<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);

    final bookmarkUserKey = box.keys.firstWhere(
      (key) => box.get(key)?.id == userId,
      orElse: () => null,
    );

    if (bookmarkUserKey != null) {
      await box.delete(bookmarkUserKey);
      return true;
    } else {
      return false;
    }
  }
}
