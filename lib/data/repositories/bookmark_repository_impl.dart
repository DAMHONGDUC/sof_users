import 'package:hive_flutter/hive_flutter.dart';
import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/core/constants/constants.dart';
import 'package:sof_users/data/source/local/entity/db_bookmark_user.dart';
import 'package:sof_users/domain/model/user_model.dart';
import 'package:sof_users/domain/repositories/bookmark_repository.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  @override
  Future<List<DBBookmarkUser>> getListBookmark() async {
    try {
      await Hive.openBox<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);

      final box = Hive.box<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);
      return box.values.toList();
    } catch (err) {
      Log.e("getListgetListBookmarkReputation", err);
    }
    return [];
  }

  @override
  Future<bool> toggleBookmark({required UserModel user}) async {
    try {
      final box =
          await Hive.openBox<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER);

      final bookmarkUserKey = box.keys.firstWhere(
        (key) => box.get(key)?.id == user.id,
        orElse: () => null,
      );

      if (bookmarkUserKey != null) {
        // delete
        await box.delete(bookmarkUserKey);
      } else {
        // add
        DBBookmarkUser dbBookmarkUser = DBBookmarkUser()
          ..displayName = user.displayName
          ..profileImage = user.profileImage
          ..location = user.location
          ..reputation = user.reputation
          ..id = user.id;

        await Hive.box<DBBookmarkUser>(LocalDBConstants.DB_BOOKMARK_USER)
            .add(dbBookmarkUser);
      }
      return true;
    } catch (err) {
      Log.e("toggleBookmark", err);
    }

    return false;
  }
}
