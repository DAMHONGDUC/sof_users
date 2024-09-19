import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/data/repositories/bookmark_repository_impl.dart';
import 'package:sof_users/domain/model/user_model.dart';

class GetListBookmarkUC {
  GetListBookmarkUC({
    required this.repository,
  });

  final BookmarkRepositoryImpl repository;

  Future<List<UserModel>> call({Map<String, dynamic>? params}) async {
    final response = await repository.getListBookmark();

    Log.d(response);

    return [];
  }
}
