import 'package:flutter/material.dart';
import 'package:sof_users/app/utils/extension.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    this.content,
  });

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) {
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
          style:
              AppTextStyle.small().copyWith(color: AppColors.grey).wSemiBold(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      )
    ]);
  }
}
