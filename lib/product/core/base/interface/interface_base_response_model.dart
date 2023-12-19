abstract class IBaseResponseModel<T> {
  IBaseResponseModel(this.data, this.statusCode, this.headers);
  final T? data;
  final int? statusCode;
  final Map<String, dynamic>? headers;
}
