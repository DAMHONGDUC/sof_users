import 'package:flutter/material.dart';
import 'package:sof_users/app/widgets/custom_switch.dart';
import 'package:sof_users/app/widgets/item_spacing.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar(
      {super.key,
      required this.onSwitcherChanged,
      required this.switcherValue});
  final void Function(bool) onSwitcherChanged;

  final bool switcherValue;

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
      actions: [
        Row(
          children: [
            Text(
              "Only bookmark",
              style: AppTextStyle.small().copyWith(color: AppColors.white),
            ),
            const HorizontalSpacing(),
            CustomSwitch(onChanged: onSwitcherChanged, value: switcherValue),
            const HorizontalSpacing(),
          ],
        )
      ],
    );
  }
}
