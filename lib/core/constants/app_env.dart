import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppENV {
  static final String ENV = dotenv.env['ENV'] ?? "dev";
  static final String BASE_URL =
      dotenv.env['BASE_URL'] ?? "https://api.stackexchange.com/2.2/";
}
