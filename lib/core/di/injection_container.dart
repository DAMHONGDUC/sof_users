import 'package:get_it/get_it.dart';
import 'package:sof_users/app/screens/user_detail/bloc/user_detail_bloc.dart';
import 'package:sof_users/data/repositories/bookmark_repository_impl.dart';
import 'package:sof_users/data/repositories/user_repository_impl.dart';
import 'package:sof_users/domain/use_cases/get_list_reputation_uc.dart';
import 'package:sof_users/domain/use_cases/toggle_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_list_bookmark_uc.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register repositories
  getIt.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl());
  getIt.registerLazySingleton<BookmarkRepositoryImpl>(
      () => BookmarkRepositoryImpl());

  // Register use case
  getIt.registerLazySingleton<GetSofUserUC>(() => GetSofUserUC(
        repository: getIt<UserRepositoryImpl>(),
      ));
  getIt.registerLazySingleton<GetListBookmarkUC>(() => GetListBookmarkUC(
        repository: getIt<BookmarkRepositoryImpl>(),
      ));
  getIt.registerLazySingleton<ToggleBookmarkUC>(() => ToggleBookmarkUC(
        repository: getIt<BookmarkRepositoryImpl>(),
      ));
  getIt.registerLazySingleton<GetListReputationUC>(() => GetListReputationUC(
        repository: getIt<UserRepositoryImpl>(),
      ));

  // Register blocs
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
      toggleBookmarkUC: getIt<ToggleBookmarkUC>(),
      getSofUserUC: getIt<GetSofUserUC>(),
      getListBookmarkUC: getIt<GetListBookmarkUC>()));
  getIt.registerFactory<UserDetailBloc>(
      () => UserDetailBloc(getListReputationUC: getIt<GetListReputationUC>()));
}

Future<void> resetLocator() async {
  await getIt.reset();
  await setupLocator();
}
