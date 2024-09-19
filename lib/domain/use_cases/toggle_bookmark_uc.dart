import 'package:sof_users/data/repositories/bookmark_repository_impl.dart';
import 'package:sof_users/domain/model/user_model.dart';

class ToggleBookmarkUC {
  ToggleBookmarkUC({
    required this.repository,
  });

  final BookmarkRepositoryImpl repository;

  Future<void> call({required UserModel user}) async {
    await repository.toggleBookmark(user: user);
  }
}
