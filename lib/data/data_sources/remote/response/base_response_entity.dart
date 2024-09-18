import 'package:json_annotation/json_annotation.dart';

part 'base_response_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseEntity<T> {
  @JsonKey(name: 'items')
  final T? items;

  @JsonKey(name: 'has_more')
  final bool? hasMore;

  @JsonKey(name: 'quota_max')
  final int? quotaMax;

  @JsonKey(name: 'quota_remaining')
  final int? quotaRemaining;

  BaseResponseEntity(
      this.items, this.hasMore, this.quotaMax, this.quotaRemaining);

  factory BaseResponseEntity.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseEntityFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseEntityToJson(this, toJsonT);
}
