import 'package:dio/dio.dart';
import 'package:sof_users/core/constants/app_enum.dart';

import 'package:sof_users/core/network/dio/dio_client.dart';
import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/app/utils/toast_manager.dart';

class DioService {
  static Future<Response?> get(
    String url, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Dio dioClient = await DioClient.getDio();
      final Response response =
          await dioClient.get(url, queryParameters: queryParams);

      return response;
    } catch (e) {
      ToastManager.showNotificationToast(
          type: ToastType.Error, msg: "GET ERROR: $e");
      Log.e("DioService", e);
    }
    return null;
  }
}
