import 'package:get_it/get_it.dart';
import 'package:sof_users/data/repositories/bookmark_repository_impl.dart';
import 'package:sof_users/data/repositories/sof_repository_impl.dart';
import 'package:sof_users/domain/use_cases/add_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/delete_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_list_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register repositories
  getIt.registerLazySingleton<SofRepositoryImpl>(() => SofRepositoryImpl());
  getIt.registerLazySingleton<BookmarkRepositoryImpl>(
      () => BookmarkRepositoryImpl());

  // Register use case
  getIt.registerLazySingleton<GetSofUserUC>(() => GetSofUserUC(
        repository: getIt<SofRepositoryImpl>(),
      ));
  getIt.registerLazySingleton<GetListBookmarkUC>(() => GetListBookmarkUC(
        repository: getIt<BookmarkRepositoryImpl>(),
      ));
  getIt.registerLazySingleton<AddBookmarkUC>(() => AddBookmarkUC(
        repository: getIt<BookmarkRepositoryImpl>(),
      ));
  getIt.registerLazySingleton<DeleteBookmarkUC>(() => DeleteBookmarkUC(
        repository: getIt<BookmarkRepositoryImpl>(),
      ));

  // Register blocs
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
      addBookmarkUC: getIt<AddBookmarkUC>(),
      deleteBookmarkUC: getIt<DeleteBookmarkUC>(),
      getSofUserUC: getIt<GetSofUserUC>(),
      getListBookmarkUC: getIt<GetListBookmarkUC>()));
}

Future<void> resetLocator() async {
  await getIt.reset();
  await setupLocator();
}
