
class BaseResponse<T> {
  final List<T>? items;
  final bool? hasMore;

  BaseResponse({this.items, this.hasMore});
}
