import 'package:flutter_screenutil/flutter_screenutil.dart';

class Helpers {
  static double customFontSizeResolver(
      {required num fontSize,
      required ScreenUtil screenUtil,
      bool isLandscape = false}) {
    if (isLandscape) {
      return 2 * fontSize * 1.h;
    }

    return FontSizeResolvers.width(fontSize, screenUtil);
  }

  static Future<void> delay(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }
}
