import 'package:sof_users/data/repositories/bookmark_repository_impl.dart';

class DeleteBookmarkUC {
  DeleteBookmarkUC({
    required this.repository,
  });

  final BookmarkRepositoryImpl repository;

  Future<bool> call({required String userId}) async {
    return await repository.deleteBookmark(userId: userId);
  }
}
