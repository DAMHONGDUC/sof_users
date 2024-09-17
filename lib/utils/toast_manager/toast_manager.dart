import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sof_users/core/constants/app_enum.dart';
import 'package:sof_users/core/resources/app_colors.dart';
import 'package:sof_users/core/widgets/custom_toast/custom_toast.dart';

class ToastManager {
  static showNotificationToast(
      {ToastType type = ToastType.Info,
      String msg = "info",
      int duration = 3}) {
    Color backgroundColor;
    String title;
    IconData icon;

    switch (type) {
      case ToastType.Success:
        backgroundColor = AppColors.successToast;
        title = "common.success".tr();
        icon = Icons.check;
        break;
      case ToastType.Error:
        backgroundColor = AppColors.errorToast;
        title = "common.error".tr();
        icon = Icons.error;
        break;
      case ToastType.Warning:
        backgroundColor = AppColors.warningToast;
        title = "common.warning".tr();
        icon = Icons.warning;
        break;
      case ToastType.Info:
        backgroundColor = AppColors.infoToast;
        title = "common.information".tr();
        icon = Icons.info;
        break;
    }

    BotToast.showCustomNotification(
      toastBuilder: (cancel) {
        return CustomToast(
          cancelFunc: cancel,
          title: title,
          message: msg,
          backgroundColor: backgroundColor,
          icon: icon,
        );
      },
      duration: Duration(seconds: duration),
    );
  }
}
