import 'package:dio/dio.dart';

class ErrorInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // handle refresh token if 401,...

    super.onError(err, handler);
  }
}
