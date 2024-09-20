import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sof_users/data/source/local/entity/db_bookmark_user.dart';

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

  static Future<void> initHive() async {
    Directory? hivePath = await getApplicationSupportDirectory();
    await Hive.initFlutter(hivePath.path);
    Hive.registerAdapter(DBBookmarkUserAdapter());
  }
}

class AppTimeFormat {
  String formatMilisecTime(int? postId) {
    if (postId == null) {
      return "";
    }

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(postId * 1000);
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }
}
