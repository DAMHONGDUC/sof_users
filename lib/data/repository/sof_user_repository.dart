import 'dart:convert';

import 'package:sof_users/core/constants/app_endpoints.dart';
import 'package:sof_users/core/network/dio/dio_service.dart';
import 'package:sof_users/data/data_sources/remote/entity/user_entity.dart';
import 'package:sof_users/data/data_sources/remote/i_sof_user.dart';
import 'package:sof_users/data/data_sources/remote/response/base_response_entity.dart';

class SofUserRepository implements ISofUser {
  @override
  Future<BaseResponseEntity<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params}) async {
    final response =
        await DioService.get(AppEndpoints.USERS, queryParams: params);

    if (response?.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.toString());

      final baseResponse =
          BaseResponseEntity<List<UserEntity>>.fromJson(json, (data) {
        return (data as List<dynamic>)
            .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      });

      return baseResponse;
    }

    return null;
  }
}
