import 'dart:ui';

class AppConstants {
  static const designSize = Size(360, 690);
  static const String APP_NAME = 'SOF Users';
  static const String ENV_FILE = '.env';
}

class AppTranslations {
  static const supportedLocales = [Locale('en'), Locale('vi')];
  static const path = "lib/core/translations";
  static const defaultLocale = Locale('en');

  static const String EN = 'en';
  static const String VI = 'vi';

  static List<String> getAllCodes() {
    return [EN, VI];
  }
}

class LocalDBConstants {
  static const String DB_BOOKMARK_USER = 'DB_BOOKMARK_USER';
}
