import 'dart:convert';

import 'package:sof_users/core/constants/app_endpoints.dart';
import 'package:sof_users/core/network/base_response/base_response.dart';
import 'package:sof_users/core/network/dio/dio_service.dart';
import 'package:sof_users/data/data_sources/remote/entity/user_entity.dart';
import 'package:sof_users/data/data_sources/remote/i_sof_user.dart';
import 'package:sof_users/utils/log/log.dart';

class SofUserRepository implements ISofUser {
  @override
  Future<BaseResponse<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params}) async {
    final response =
        await DioService.get(AppEndpoints.USERS, queryParams: params);

    if (response?.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.toString());

      final baseResponse =
          BaseResponse<List<UserEntity>>.fromJson(json, (data) {
        Log.d(data);
        return [];
        // return UserEntity.fromJson(data as Map<String, dynamic>);
      });

      return baseResponse;
    }

    return null;
  }
}
