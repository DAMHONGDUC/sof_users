import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class CustomInkWell extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final double? borderRadius;
  const CustomInkWell(
      {super.key, required this.child, required this.onTap, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
