import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle xSmall() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black_text);

  static TextStyle small() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black_text);

  static TextStyle xBase() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black_text);

  static TextStyle base() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black_text);

  static TextStyle medium() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black_text);

  static TextStyle large() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black_text);

  static TextStyle xLarge() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.black_text);

  static TextStyle xxLarge() => TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24.sp,
      fontWeight: FontWeight.w900,
      color: AppColors.black_text);
}

extension TextStyleExt on TextStyle {
  TextStyle wLight() => copyWith(fontWeight: FontWeight.w300);

  TextStyle wRegular() => copyWith(fontWeight: FontWeight.w400);

  TextStyle wMedium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle wSemiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle wBold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle size(double fontSize) => copyWith(fontSize: fontSize);

  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);
}
