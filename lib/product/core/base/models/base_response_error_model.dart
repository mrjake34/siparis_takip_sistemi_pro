final class BaseResponseErrorModel<T> {
  BaseResponseErrorModel({
    this.error,
    this.data,
  });

  factory BaseResponseErrorModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseErrorModel<T>(
      data: json['data'] as T?,
      error: json['error'] as String?,
    );
  }
  final T? data;
  final String? error;
}
