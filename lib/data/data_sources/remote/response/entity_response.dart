import 'package:json_annotation/json_annotation.dart';

part 'entity_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class EntityResponse<T> {
  @JsonKey(name: 'items')
  final T? items;

  @JsonKey(name: 'has_more')
  final bool? hasMore;

  @JsonKey(name: 'quota_max')
  final int? quotaMax;

  @JsonKey(name: 'quota_remaining')
  final int? quotaRemaining;

  EntityResponse(this.items, this.hasMore, this.quotaMax, this.quotaRemaining);

  factory EntityResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$EntityResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$EntityResponseToJson(this, toJsonT);
}
