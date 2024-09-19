class UserModel {
  final String? displayName;
  final String? profileImage;
  final String? location;
  final int? reputation;

  UserModel(
      {required this.displayName,
      required this.profileImage,
      required this.location,
      required this.reputation});
}
