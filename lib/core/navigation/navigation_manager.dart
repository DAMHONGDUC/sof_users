import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:sof_users/core/navigation/app_router.dart';
import 'package:sof_users/core/navigation/stack/home_stack.dart';
import 'package:sof_users/core/navigation/stack/landing_stack.dart';
import 'package:sof_users/app/widgets/app/app_screen.dart';

class NavigationManager {
  factory NavigationManager() {
    return _instance;
  }

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _bottomTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'bottomTabNavigatorKey');

  static final NavigationManager _instance = NavigationManager._internal();
  static NavigationManager get instance => _instance;
  static late final GoRouter router;
  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;
  GoRouterDelegate get routerDelegate => router.routerDelegate;
  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  NavigationManager._internal() {
    router = GoRouter(
      observers: [BotToastNavigatorObserver(), FlutterSmartDialog.observer],
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRouter.LANDING.location,
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        ...LandingStack.routes,
        ShellRoute(
            navigatorKey: _bottomTabNavigatorKey,
            pageBuilder:
                (BuildContext context, GoRouterState state, Widget child) {
              return AppRouter.getPage(
                child: AppScreen(child: child),
                state: state,
              );
            },
            routes: [
              HomeStack.route,
            ])
      ],
    );
  }
}
