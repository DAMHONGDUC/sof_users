import 'package:get_it/get_it.dart';
import 'package:sof_users/features/home/bloc/home_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Register repositories

  // Register blocs
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
}

Future<void> resetLocator() async {
  await getIt.reset();
  await setupLocator();
}
