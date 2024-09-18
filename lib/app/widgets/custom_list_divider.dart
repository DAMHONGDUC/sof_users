import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class CustomListDivider extends StatelessWidget {
  const CustomListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.black,
      thickness: 0.1,
      height: 0,
    );
  }
}
