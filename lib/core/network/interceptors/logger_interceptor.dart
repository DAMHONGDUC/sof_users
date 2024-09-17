import 'package:dio/dio.dart';
import 'package:sof_users/utils/log/log.dart';

class LoggerInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    Log.e(options.method, 'request => $requestPath');
    Log.d('Error: ${err.error}, Message: ${err.message}');

    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    Log.i('${options.method} request => $requestPath');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.d('StatusCode: ${response.statusCode}, Data: ${response.data}');

    super.onResponse(response, handler);
  }
}
