class PaginationRequest {
  final int page;
  final int pageSize;
  final String site;

  PaginationRequest(
      {required this.page, required this.pageSize, required this.site});

  factory PaginationRequest.init() =>
      PaginationRequest(page: 0, pageSize: 30, site: "stackoverflow");

  Map<String, dynamic> toParams() {
    return {
      "page": page,
      "pagesize": pageSize,
      "site": site,
    };
  }

  PaginationRequest copyWith({
    int? page,
    int? pageSize,
    String? site,
  }) {
    return PaginationRequest(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      site: site ?? this.site,
    );
  }
}
