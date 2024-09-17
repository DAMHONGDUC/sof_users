import 'package:get_it/get_it.dart';
import 'package:sof_users/data/repository/sof_user_repository.dart';
import 'package:sof_users/domain/use_case/get_sof_user_uc.dart';
import 'package:sof_users/features/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register repositories
  getIt.registerLazySingleton<SofUserRepository>(() => SofUserRepository());

  // Register use case
  getIt.registerLazySingleton<GetSofUserUC>(() => GetSofUserUC(
        repository: getIt<SofUserRepository>(),
      ));

  // Register blocs
  getIt.registerFactory<HomeBloc>(() =>
      HomeBloc(getSofUserUC: getIt<GetSofUserUC>())..add(HomeStartEvent()));
}

Future<void> resetLocator() async {
  await getIt.reset();
  await setupLocator();
}
