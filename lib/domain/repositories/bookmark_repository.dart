import 'package:sof_users/data/source/local/entity/db_bookmark_user.dart';
import 'package:sof_users/domain/model/user_model.dart';

abstract class BookmarkRepository {
  Future<bool> addBookmark({required UserModel user});

  Future<bool> deleteBookmark({required String userId});

  Future<List<DBBookmarkUser>> getListBookmark();
}
