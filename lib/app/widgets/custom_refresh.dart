import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'dart:math' as math;

class CustomRefresh extends StatelessWidget {
  const CustomRefresh(
      {super.key, required this.onRefresh, required this.child});
  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      onRefresh: onRefresh,
      backgroundColor: AppColors.white,
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircularProgressIndicator(
            color: Colors.redAccent,
            value: controller.state.isLoading
                ? null
                : math.min(controller.value, 1.0),
          ),
        );
      },
      child: child,
    );
  }
}
