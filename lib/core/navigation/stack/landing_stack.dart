import 'package:go_router/go_router.dart';
import 'package:sof_users/core/navigation/app_router.dart';
import 'package:sof_users/app/screens/landing/ui/landing_screen.dart';

class LandingStack {
  static final List<RouteBase> routes = [
    GoRoute(
      path: AppRouter.LANDING.location,
      pageBuilder: (context, state) {
        return AppRouter.getPage(
          child: const LandingScreen(),
          state: state,
        );
      },
    ),
  ];
}
