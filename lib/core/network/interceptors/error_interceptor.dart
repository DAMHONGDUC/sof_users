import 'package:dio/dio.dart';

class ErrorInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // handle refresh token,...

    super.onError(err, handler);
  }
}
