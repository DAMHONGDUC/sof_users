// class GetSofUserUC {
//   GetSofUserUC({
//     required this.repository,
//   });

//   final SofRepositoryImpl repository;

//   Future<SofResponse<List<UserModel>>?> call(
//       {Map<String, dynamic>? params}) async {
//     final response = await repository.getListSOFUser(params: params);

//     return SofResponse(
//         items: response?.items?.map((e) => e.toDomain()).toList(),
//         hasMore: response?.hasMore);
//   }
// }
