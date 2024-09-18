// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_counts_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeCountsEntity _$BadgeCountsEntityFromJson(Map<String, dynamic> json) =>
    BadgeCountsEntity(
      bronze: (json['bronze'] as num?)?.toInt(),
      silver: (json['silver'] as num?)?.toInt(),
      gold: (json['gold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BadgeCountsEntityToJson(BadgeCountsEntity instance) =>
    <String, dynamic>{
      'bronze': instance.bronze,
      'silver': instance.silver,
      'gold': instance.gold,
    };
