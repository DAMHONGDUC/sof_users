import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/app/widgets/custom_cached_image.dart';
import 'package:sof_users/app/widgets/custom_inkwell.dart';
import 'package:sof_users/app/widgets/info_row.dart';
import 'package:sof_users/app/widgets/item_spacing.dart';
import 'package:sof_users/core/resources/app_box_model.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_icon_size.dart';
import 'package:sof_users/core/resources/app_text_style.dart';
import 'package:sof_users/domain/model/user_model.dart';

class SofUserRow extends StatelessWidget {
  const SofUserRow(
      {super.key,
      required this.user,
      required this.onToggleBookmark,
      required this.onTap});

  final void Function() onToggleBookmark;
  final void Function() onTap;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    Widget buildLeftWidget() {
      return Row(
        children: [
          CustomCachedImage(
            imageURL: user.profileImage,
            size: 50.sp,
          ),
          const HorizontalSpacing(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.displayName ?? "No name",
                  style: AppTextStyle.base().wSemiBold(),
                ),
                InfoRow(title: "Location", content: user.location),
                InfoRow(
                    title: "Reputation", content: user.reputation.toString())
              ],
            ),
          ),
        ],
      );
    }

    Widget buildRightWidget() {
      return CustomInkWell(
          borderRadius: 100.sp,
          onTap: onToggleBookmark,
          child: Container(
            padding: EdgeInsets.all(AppBoxModel.halfMainPadding()),
            child: Icon(
              Icons.star,
              size: AppIconSize.base(),
              color: user.isBookmark ? AppColors.red : AppColors.grey,
            ),
          ));
    }

    return CustomInkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppBoxModel.halfMainPadding()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(child: buildLeftWidget()), buildRightWidget()],
        ),
      ),
    );
  }
}
