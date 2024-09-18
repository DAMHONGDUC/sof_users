import 'dart:convert';

import 'package:sof_users/core/constants/app_endpoints.dart';
import 'package:sof_users/core/network/dio/dio_service.dart';
import 'package:sof_users/data/source/remote/entity/user_entity.dart';
import 'package:sof_users/data/source/remote/response/entity_response.dart';
import 'package:sof_users/domain/repositories/sof_repository.dart';

class SofRepositoryImpl implements SofRepository {
  @override
  Future<EntityResponse<List<UserEntity>>?> getListSOFUser(
      {Map<String, dynamic>? params}) async {
    final response =
        await DioService.get(AppEndpoints.USERS, queryParams: params);

    if (response?.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.toString());

      final baseResponse =
          EntityResponse<List<UserEntity>>.fromJson(json, (data) {
        return (data as List<dynamic>)
            .map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
            .toList();
      });

      return baseResponse;
    }

    return null;
  }
}
