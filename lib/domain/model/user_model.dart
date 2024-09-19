class UserModel {
  final String? displayName;
  final String? profileImage;
  final String? location;
  final int? reputation;
  final int id;

  UserModel(
      {this.displayName,
      this.profileImage,
      this.location,
      required this.id,
      this.reputation});
}
