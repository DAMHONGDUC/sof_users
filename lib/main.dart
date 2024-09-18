import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_users/core/constants/constants.dart';
import 'package:sof_users/core/custom_bloc/app_bloc_observer.dart';
import 'package:sof_users/core/navigation/navigation_manager.dart';
import 'package:sof_users/presentation/app/ui/app.dart';
import 'package:sof_users/utils/log/log.dart';
import 'injection_container.dart' as di;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialisation();

  runApp(
    EasyLocalization(
        path: AppTranslations.path,
        supportedLocales: AppTranslations.supportedLocales,
        startLocale: const Locale(AppTranslations.EN),
        fallbackLocale: const Locale(AppTranslations.EN),
        child: const App()),
  );
}

Future<void> initialisation() async {
  try {
    // load env
    await dotenv.load(fileName: AppConstants.ENV_FILE);

    // easy location
    await EasyLocalization.ensureInitialized();

    // bloc observer
    Bloc.observer = AppBlocObserver();

    // set up di
    await di.resetLocator();

    // set up app router
    NavigationManager.instance;
  } catch (e, stackTrace) {
    Log.e('Initialization Error: $e', stackTrace);
  }
}
