import 'package:sof_users/data/source/local/entity/db_bookmark_user.dart';
import 'package:sof_users/domain/model/user_model.dart';

abstract class BookmarkRepository {
  Future<void> toggleBookmark({required UserModel user});

  Future<List<DBBookmarkUser>> getListBookmark();
}
