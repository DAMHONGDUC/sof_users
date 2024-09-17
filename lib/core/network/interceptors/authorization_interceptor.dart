import 'package:dio/dio.dart';

class AuthorizationInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // add token,...
    super.onRequest(options, handler);
  }
}
