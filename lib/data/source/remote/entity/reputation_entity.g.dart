// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReputationEntity _$ReputationEntityFromJson(Map<String, dynamic> json) =>
    ReputationEntity(
      reputationHistoryType: json['reputation_history_type'] as String?,
      reputationChange: (json['reputation_change'] as num?)?.toInt(),
      postId: (json['post_id'] as num).toInt(),
      creationDate: (json['creation_date'] as num?)?.toInt(),
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$ReputationEntityToJson(ReputationEntity instance) =>
    <String, dynamic>{
      'reputation_history_type': instance.reputationHistoryType,
      'reputation_change': instance.reputationChange,
      'post_id': instance.postId,
      'creation_date': instance.creationDate,
      'user_id': instance.userId,
    };
