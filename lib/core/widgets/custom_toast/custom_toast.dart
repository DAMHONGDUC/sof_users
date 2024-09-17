import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/core/resources/app_box_model.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_icon_size.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class CustomToast extends StatelessWidget {
  final CancelFunc cancelFunc;
  final Color backgroundColor;
  final String title;
  final String? message;
  final IconData? icon;

  const CustomToast({
    super.key,
    required this.cancelFunc,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = 10.sp;
    const mainColor = AppColors.white;
    final padding = AppBoxModel.halfMainPadding();
    final iconSize = AppIconSize.small();

    return Container(
      padding: EdgeInsets.all(AppBoxModel.halfMainPadding()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            color: backgroundColor,
            elevation: 5.sp,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Icon(
                    icon,
                    color: mainColor,
                    size: iconSize,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, padding, padding, padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.base().copyWith(
                              color: mainColor, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          message ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: AppTextStyle.small().copyWith(
                              color: mainColor, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: mainColor,
                      size: iconSize,
                    ),
                    onPressed: cancelFunc,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
