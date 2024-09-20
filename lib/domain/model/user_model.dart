class UserModel {
  final String? displayName;
  final String? profileImage;
  final String? location;
  final int? reputation;
  final int id;
  final bool isBookmark;

  UserModel(
      {this.displayName,
      this.profileImage,
      this.location,
      required this.id,
      this.isBookmark = false,
      this.reputation});

  UserModel copyWith({
    String? displayName,
    String? profileImage,
    String? location,
    int? reputation,
    int? id,
    bool? isBookmark,
  }) {
    return UserModel(
      displayName: displayName ?? this.displayName,
      profileImage: profileImage ?? this.profileImage,
      location: location ?? this.location,
      reputation: reputation ?? this.reputation,
      id: id ?? this.id, // Since id is required, you can leave it like this
      isBookmark: isBookmark ?? this.isBookmark,
    );
  }
}
