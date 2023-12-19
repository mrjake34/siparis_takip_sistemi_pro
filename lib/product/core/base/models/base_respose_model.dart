/// Base response model for all api responses
final class BaseResponseModel<T> {
  /// Base response model contructor method
  BaseResponseModel({
    this.data,
    this.statusCode,
    this.headers,
  });
  final T? data;
  final int? statusCode;
  final Map<String, dynamic>? headers;
}
