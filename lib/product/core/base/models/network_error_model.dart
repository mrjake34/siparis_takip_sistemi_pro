import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

final class NetworkErrorModel {
  NetworkErrorModel({
    this.error,
  });
  factory NetworkErrorModel.getStatus(String message) {
    return NetworkErrorModel(
      error: NetworkStatus.getStatus(message),
    );
  }

  NetworkErrorModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  NetworkStatus? error;
}
