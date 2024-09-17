import 'package:sof_users/core/constants/app_env.dart';

class AppEndpoints {
  AppEndpoints._();

  static const Map<String, String> BASE_REQUEST_HEADER = {
    'Accept': 'application/json;charset=utf-t',
    'Accept-Language': 'en',
  };

  static const int RECEIVE_TIMEOUT = 5000;

  static const int CONNECT_TIMEOUT = 3000;

  static final String BASE_API_URL = AppENV.BASE_URL;

  static const String USERS = 'users';
}
