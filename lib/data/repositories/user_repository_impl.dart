import 'dart:convert';

import 'package:sof_users/app/utils/log.dart';
import 'package:sof_users/core/constants/app_endpoints.dart';
import 'package:sof_users/core/network/base_response/base_response.dart';
import 'package:sof_users/core/network/dio/dio_service.dart';
import 'package:sof_users/data/source/remote/entity/reputation_entity.dart';
import 'package:sof_users/data/source/remote/entity/user_entity.dart';
import 'package:sof_users/domain/repositories/sof_repository.dart';

class UserRepositoryImpl implements SofRepository {
  @override
  Future<BaseResponse<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params}) async {
    try {
      final response =
          await DioService.get(AppEndpoints.USERS, queryParams: params);

      if (response?.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.toString());

        final baseResponse =
            BaseResponse<List<UserEntity>>.fromJson(json, (data) {
          return (data as List<dynamic>)
              .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
              .toList();
        });

        return baseResponse;
      }
    } catch (err) {
      Log.e("getListSOFUser", err);
    }

    return null;
  }

  @override
  Future<BaseResponse<List<ReputationEntity>>?> getListReputation(
      {required int userId, Map<String, dynamic>? params}) async {
    try {
      final response = await DioService.get(
          '${AppEndpoints.USERS}/$userId/${AppEndpoints.REPUTATION_HISTORY}',
          queryParams: params);

      if (response?.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.toString());

        final baseResponse =
            BaseResponse<List<ReputationEntity>>.fromJson(json, (data) {
          return (data as List<dynamic>)
              .map((e) => ReputationEntity.fromJson(e as Map<String, dynamic>))
              .toList();
        });

        return baseResponse;
      }
    } catch (err) {
      Log.e("getListReputation", err);
    }

    return null;
  }
}
