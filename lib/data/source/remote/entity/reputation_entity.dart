import 'package:json_annotation/json_annotation.dart';
import 'package:sof_users/domain/model/reputation_model.dart';

part 'reputation_entity.g.dart';

@JsonSerializable()
class ReputationEntity {
  @JsonKey(name: 'reputation_history_type')
  final String? reputationHistoryType;

  @JsonKey(name: 'reputation_change')
  final int? reputationChange;

  @JsonKey(name: 'post_id')
  final int postId;

  @JsonKey(name: 'creation_date')
  final int? creationDate;

  @JsonKey(name: 'user_id')
  final int userId;

  ReputationEntity({
    this.reputationHistoryType,
    this.reputationChange,
    required this.postId,
    this.creationDate,
    required this.userId,
  });

  factory ReputationEntity.fromJson(Map<String, dynamic> json) =>
      _$ReputationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReputationEntityToJson(this);

  ReputationModel toDomain() => ReputationModel(
      creationDate: creationDate,
      postId: postId,
      reputationChange: reputationChange,
      reputationHistoryType: reputationHistoryType);
}
