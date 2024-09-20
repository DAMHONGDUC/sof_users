import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sof_users/app/screens/user_detail/ui/user_detail_screen.dart';
import 'package:sof_users/core/navigation/app_router.dart';
import 'package:sof_users/app/screens/home/ui/home_screen.dart';

class HomeStack {
  static final GoRoute route = GoRoute(
      path: AppRouter.HOME.path,
      pageBuilder: (context, state) {
        return AppRouter.getPage(
          child: const HomeScreen(),
          state: state,
        );
      },
      routes: [
        GoRoute(
          path: AppRouter.USER_DETAIL.path,
          builder: (BuildContext context, GoRouterState state) {
            final UserDetailArgs args = state.extra as UserDetailArgs;
            return UserDetailScreen(
              args: args,
            );
          },
        )
      ]);
}
