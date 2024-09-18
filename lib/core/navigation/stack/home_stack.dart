import 'package:go_router/go_router.dart';
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
  );
}
