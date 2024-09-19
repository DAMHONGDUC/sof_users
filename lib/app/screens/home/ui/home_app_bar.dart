import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary_light,
      title: Text(
        "Home",
        style: AppTextStyle.base().copyWith(color: AppColors.white).wBold(),
      ),
      centerTitle: false,
    );
  }
}
