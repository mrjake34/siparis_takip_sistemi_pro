final class NetworkErrorModel {
  NetworkErrorModel({
    this.message,
  });

  factory NetworkErrorModel.fromJson(Map<String, dynamic> json) {
    return NetworkErrorModel(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic>? toJson() {
    return {
      'message': message,
    };
  }

  final String? message;
}
