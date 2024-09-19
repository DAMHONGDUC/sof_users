import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch(
      {super.key,
      required this.onChanged,
      this.cusomSize,
      required this.value});
  final void Function(bool) onChanged;
  final double? cusomSize;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final size = cusomSize ?? 30.sp;

    return SizedBox(
      width: size * 1.3,
      height: size,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Switch(
          activeColor: AppColors.red,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
