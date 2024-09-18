import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sof_users/app/utils/seperated_list_view.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/resources/app_text_style.dart';

class CustomListSkeleton extends StatelessWidget {
  final int itemCount;
  final double height;
  final double padding;
  const CustomListSkeleton(
      {super.key, this.itemCount = 10, this.height = 80, this.padding = 20});

  @override
  Widget build(BuildContext context) {
    const mockText = "aaaaaaaaaaaaa";

    return Expanded(
      child: SingleChildScrollView(
        child: Skeletonizer(
          enabled: true,
          child: SeperatedListView(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(20.sp),
                  color: AppColors.secondary_background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            mockText,
                            style: AppTextStyle.base(),
                          ),
                          SizedBox(
                            height: 3.w,
                          ),
                          Text(
                            mockText + mockText,
                            style: AppTextStyle.base(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
