import 'package:easy_localization/easy_localization.dart';

class DioErrorMessage {
  static String getErrorMessage(String key) {
    return "backEndError.$key".tr();
  }
}
