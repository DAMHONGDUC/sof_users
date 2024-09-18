class GetSofUsersRequest {
  final int page;
  final int pageSize;
  final String site;

  GetSofUsersRequest(
      {required this.page, required this.pageSize, required this.site});

  factory GetSofUsersRequest.init() =>
      GetSofUsersRequest(page: 1, pageSize: 30, site: "stackoverflow");

  Map<String, dynamic> toParams() {
    return {
      "page": page,
      "pagesize": pageSize,
      "site": site,
    };
  }

  GetSofUsersRequest copyWith({
    int? page,
    int? pageSize,
    String? site,
  }) {
    return GetSofUsersRequest(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      site: site ?? this.site,
    );
  }
}
