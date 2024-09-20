class ReputationModel {
  final String? reputationHistoryType;
  final int? reputationChange;
  final int postId;
  final int? creationDate;

  ReputationModel({
    this.reputationHistoryType,
    this.reputationChange,
    required this.postId,
    this.creationDate,
  });

  ReputationModel copyWith({
    String? reputationHistoryType,
    int? reputationChange,
    int? postId,
    int? creationDate,
    int? userId,
  }) {
    return ReputationModel(
      reputationHistoryType:
          reputationHistoryType ?? this.reputationHistoryType,
      reputationChange: reputationChange ?? this.reputationChange,
      postId: postId ?? this.postId,
      creationDate: creationDate ?? this.creationDate,
    );
  }
}
