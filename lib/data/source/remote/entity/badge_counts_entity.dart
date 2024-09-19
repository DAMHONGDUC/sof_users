import 'package:json_annotation/json_annotation.dart';

part 'badge_counts_entity.g.dart';

@JsonSerializable()
class BadgeCountsEntity {
  @JsonKey(name: 'bronze')
  final int? bronze;

  @JsonKey(name: 'silver')
  final int? silver;

  @JsonKey(name: 'gold')
  final int? gold;

  BadgeCountsEntity({
    this.bronze,
    this.silver,
    this.gold,
  });

  factory BadgeCountsEntity.fromJson(Map<String, dynamic> json) =>
      _$BadgeCountsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BadgeCountsEntityToJson(this);
}
