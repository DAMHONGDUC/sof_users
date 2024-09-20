import 'package:sof_users/data/repositories/bookmark_repository_impl.dart';
import 'package:sof_users/domain/model/user_model.dart';

class ToggleBookmarkUC {
  ToggleBookmarkUC({
    required this.repository,
  });

  final BookmarkRepositoryImpl repository;

  Future<bool> call({required UserModel user}) async {
    return await repository.toggleBookmark(user: user);
  }
}
