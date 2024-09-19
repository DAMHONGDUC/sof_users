import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/core/resources/app_assets.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_icon_size.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.primary_background,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.icEmpty,
                    width: AppIconSize.medium(),
                    height: AppIconSize.medium(),
                    color: AppColors.grey_text,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    title ?? "common.empty".tr(),
                    style: AppTextStyle.small().copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey_text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )));
  }
}
