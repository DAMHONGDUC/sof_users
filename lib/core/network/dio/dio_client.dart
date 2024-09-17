import 'package:dio/dio.dart';
import 'package:sof_users/core/constants/app_endpoints.dart';
import 'package:sof_users/core/network/interceptors/authorization_interceptor.dart';
import 'package:sof_users/core/network/interceptors/error_interceptor.dart';
import 'package:sof_users/core/network/interceptors/logger_interceptor.dart';

class DioClient {
  DioClient._();

  static Dio? _dio;

  static Future<Dio> getDio([Dio? dio]) async {
    if (_dio != null) {
      return _dio!;
    }

    _dio = await _getDio(dio: dio);
    return _dio!;
  }

  static Future<Dio> _getDio({Dio? dio}) async {
    final resultDio = dio ?? Dio();

    resultDio.options = BaseOptions(
        baseUrl: AppEndpoints.BASE_API_URL,
        headers: AppEndpoints.BASE_REQUEST_HEADER,
        connectTimeout: const Duration(seconds: AppEndpoints.CONNECT_TIMEOUT),
        receiveTimeout: const Duration(seconds: AppEndpoints.RECEIVE_TIMEOUT),
        responseType: ResponseType.json);

    resultDio.interceptors.addAll(
        [AuthorizationInterceptor(), LoggerInterceptor(), ErrorInterceptor()]);

    return resultDio;
  }
}
