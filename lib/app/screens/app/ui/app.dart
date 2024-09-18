import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:sof_users/core/constants/constants.dart';
import 'package:sof_users/core/custom_bloc/custom_bloc_provider.dart';
import 'package:sof_users/core/navigation/navigation_manager.dart';
import 'package:sof_users/core/themes/themes.dart';
import 'package:sof_users/app/utils/helpers.dart';
import 'package:easy_localization/easy_localization.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return CustomBlocProvider(
      child: ScreenUtilInit(
          fontSizeResolver: (num fontSize, ScreenUtil screenUtil) =>
              Helpers.customFontSizeResolver(
                  fontSize: fontSize,
                  screenUtil: screenUtil,
                  isLandscape: isLandscape),
          designSize: AppConstants.designSize,
          minTextAdapt: true,
          child: MaterialApp.router(
            builder: (context, myWidget) {
              myWidget = BotToastInit()(context, myWidget);
              myWidget = FlutterSmartDialog.init()(context, myWidget);
              return myWidget;
            },
            title: AppConstants.APP_NAME,
            theme: AppTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: NavigationManager.router,
          )),
    );
  }
}
