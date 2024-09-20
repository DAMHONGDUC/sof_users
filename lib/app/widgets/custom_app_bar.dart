import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  final List<Widget>? actions;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary_light,
      title: Text(
        title,
        style: AppTextStyle.base().copyWith(color: AppColors.white).wBold(),
      ),
      centerTitle: false,
      foregroundColor: AppColors.white,
      actions: actions,
    );
  }
}
