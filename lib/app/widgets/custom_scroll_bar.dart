import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScrollBar extends StatelessWidget {
  const CustomScrollBar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 2.sp),
      child: Scrollbar(
        thumbVisibility: true,
        thickness: 2.sp,
        child: child,
      ),
    );
  }
}
