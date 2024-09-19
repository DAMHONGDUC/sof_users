import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/core/navigation/app_router.dart';
import 'package:sof_users/core/navigation/navigation_manager.dart';
import 'package:sof_users/core/resources/app_assets.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      NavigationManager.router.pushReplacement(AppRouter.HOME.location);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = 80.sp;

    return Scaffold(
      backgroundColor: AppColors.primary_background,
      body: Container(
        child: Center(
          child: SizedBox(
            width: size,
            height: size,
            child: Image.asset(AppAssets.appLogo,
                alignment: Alignment.centerLeft, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
