import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/app/widgets/custom_cached_image.dart';
import 'package:sof_users/app/widgets/custom_inkwell.dart';
import 'package:sof_users/app/widgets/item_spacing.dart';
import 'package:sof_users/core/resources/app_box_model.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_icon_size.dart';
import 'package:sof_users/core/resources/app_text_style.dart';
import 'package:sof_users/domain/model/user_model.dart';

class SofUserRow extends StatelessWidget {
  const SofUserRow(
      {super.key, required this.user, required this.onBookmarkUser});

  final void Function() onBookmarkUser;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    Widget buildInfoRow({
      required String title,
      String? content,
    }) {
      if (content.isNullOrEmpty) {
        return const SizedBox.shrink();
      }

      return Row(children: [
        Text(
          "$title: ",
          style: AppTextStyle.xSmall().copyWith(color: AppColors.grey),
          overflow: TextOverflow.ellipsis,
        ),
        Expanded(
          child: Text(
            content!,
            style: AppTextStyle.small()
                .copyWith(color: AppColors.grey)
                .wSemiBold(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        )
      ]);
    }

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
                buildInfoRow(title: "Location", content: user.location),
                buildInfoRow(
                    title: "Reputation", content: user.reputation.toString())
              ],
            ),
          ),
        ],
      );
    }

    Widget buildRightWidget() {
      return IconButton(
          onPressed: onBookmarkUser,
          icon: Icon(
            Icons.star,
            size: AppIconSize.base(),
            color: user.isBookmark ? AppColors.red : AppColors.grey,
          ));
    }

    return CustomInkWell(
      onTap: () {},
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
