import 'package:get_it/get_it.dart';
import 'package:sof_users/data/repositories/sof_repository_impl.dart';
import 'package:sof_users/domain/use_cases/get_sof_user_uc.dart';
import 'package:sof_users/app/screens/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register repositories
  getIt.registerLazySingleton<SofRepositoryImpl>(() => SofRepositoryImpl());

  // Register use case
  getIt.registerLazySingleton<GetSofUserUC>(() => GetSofUserUC(
        repository: getIt<SofRepositoryImpl>(),
      ));

  // Register blocs
  getIt.registerFactory<HomeBloc>(
      () => HomeBloc(getSofUserUC: getIt<GetSofUserUC>()));
}

Future<void> resetLocator() async {
  await getIt.reset();
  await setupLocator();
}
