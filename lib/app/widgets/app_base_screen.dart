import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class AppBaseScreen extends StatelessWidget {
  const AppBaseScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white, //status bar color
      child: SafeArea(
        child: child,
      ),
    );
  }
}
