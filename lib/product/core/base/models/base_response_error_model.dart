import 'package:siparis_takip_sistemi_pro/product/core/base/interface/interface_base_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

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
