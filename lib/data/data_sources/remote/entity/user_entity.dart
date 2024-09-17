import 'package:json_annotation/json_annotation.dart';
import 'package:sof_users/data/data_sources/remote/entity/badge_counts_entity.dart';
import 'package:sof_users/domain/model/user_model.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey(name: 'badge_counts')
  final BadgeCountsEntity? badgeCounts;

  @JsonKey(name: 'account_id')
  final int? accountId;

  @JsonKey(name: 'is_employee')
  final bool? isEmployee;

  @JsonKey(name: 'last_modified_date')
  final int? lastModifiedDate;

  @JsonKey(name: 'last_access_date')
  final int? lastAccessDate;

  @JsonKey(name: 'reputation_change_year')
  final int? reputationChangeYear;

  @JsonKey(name: 'reputation_change_quarter')
  final int? reputationChangeQuarter;

  @JsonKey(name: 'reputation_change_month')
  final int? reputationChangeMonth;

  @JsonKey(name: 'reputation_change_week')
  final int? reputationChangeWeek;

  @JsonKey(name: 'reputation_change_day')
  final int? reputationChangeDay;

  @JsonKey(name: 'reputation')
  final int? reputation;

  @JsonKey(name: 'creation_date')
  final int? creationDate;

  @JsonKey(name: 'user_type')
  final String? userType;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'accept_rate')
  final int? acceptRate;

  @JsonKey(name: 'location')
  final String? location;

  @JsonKey(name: 'website_url')
  final String? websiteUrl;

  final String? link;

  @JsonKey(name: 'profile_image')
  final String? profileImage;

  @JsonKey(name: 'display_name')
  final String? displayName;

  UserEntity({
    this.badgeCounts,
    this.accountId,
    this.isEmployee,
    this.lastModifiedDate,
    this.lastAccessDate,
    this.reputationChangeYear,
    this.reputationChangeQuarter,
    this.reputationChangeMonth,
    this.reputationChangeWeek,
    this.reputationChangeDay,
    this.reputation,
    this.creationDate,
    this.userType,
    this.userId,
    this.acceptRate,
    this.location,
    this.websiteUrl,
    this.link,
    this.profileImage,
    this.displayName,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  UserModel toDomain() => UserModel(
      displayName: displayName,
      profileImage: profileImage,
      location: location,
      reputation: reputation);
}
