import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/interface_base_response_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';

/// Base response model for all api responses
final class BaseResponseModel<T extends IBaseNetworkModel<T>>
    implements IBaseResponseModel<T> {
  /// Base response model contructor method
  BaseResponseModel({
    this.data,
    this.statusCode,
    this.headers,
    this.error,
  });
  @override
  final T? data;
  @override
  final int? statusCode;
  @override
  final Map<String, List<dynamic>>? headers;
  @override
  NetworkErrorModel? error;

  @override
  BaseResponseModel<T> fromJson(Map<String, dynamic> json) {
    return BaseResponseModel<T>(
      data: json['data'] as T?,
      statusCode: json['statusCode'] as int?,
      headers: json['cookie'] as Map<String, List<dynamic>>?,
    );
  }

  String? getCookie({Map<String, List<dynamic>>? headers}) {
    if (headers == null) {
      return null;
    }
    final cookie = headers['set-cookie']?.first ?? 'Login Courier Cookie';
    return cookie as String?;
  }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'data': data,
      'statusCode': statusCode,
      'cookie': headers,
    };
  }

  @override
  String toString() {
    return 'BaseResponseModel(data: $data, statusCode: $statusCode, headers: $headers)';
  }

  @override
  set data(T? data) {}

  @override
  set headers(Map<String, dynamic>? headers) {}

  @override
  set statusCode(int? statusCode) {}
}
