// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityResponse<T> _$EntityResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    EntityResponse<T>(
      _$nullableGenericFromJson(json['items'], fromJsonT),
      json['has_more'] as bool?,
      (json['quota_max'] as num?)?.toInt(),
      (json['quota_remaining'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EntityResponseToJson<T>(
  EntityResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': _$nullableGenericToJson(instance.items, toJsonT),
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
