import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

final class NetworkErrorModel {
  NetworkErrorModel({
    this.message,
  });
  static NetworkStatus getStatus(String message) {
    return NetworkStatus.getStatus(message);
  }

  NetworkErrorModel fromJson(Map<String, dynamic> json) {
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
