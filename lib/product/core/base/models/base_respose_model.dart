import 'package:siparis_takip_sistemi_pro/product/core/base/interface/interface_base_response_model.dart';

import '../../constants/enums/network_status.dart';

/// Base response model for all api responses
final class BaseResponseModel<T> implements IBaseResponseModel<T> {
  /// Base response model contructor method
  BaseResponseModel({
    this.data,
    this.statusCode,
    this.headers,
    this.networkStatus,
    this.message,
    this.error,
  });
  @override
  final T? data;
  @override
  final int? statusCode;
  @override
  final NetworkStatus? networkStatus;
  @override
  final String? message;

  @override
  BaseResponseModel<T> fromJson(Map<String, dynamic> json) {
    return BaseResponseModel<T>(
      data: json['data'] as T?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );
  }

  static String? fromError(Map<String, dynamic> json) {
    return json['message'] as String?;
  }

  @override
  String? getCookie({Map<String, List<dynamic>>? headers}) {
    if (headers == null) return null;
    final cookie = headers['set-cookie']?.first as String?;
    if (cookie == null) return null;
    final cookieSplit = cookie.split(';');
    final cookieString = cookieSplit[0].split('=');
    return cookieString[1];
  }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'data': data,
      'statusCode': statusCode,
      'cookie': headers,
      'networkStatus': networkStatus?.index,
      'error': message ?? '',
    };
  }

  @override
  String toString() {
    return 'BaseResponseModel(data: $data, statusCode:'
        ' $statusCode, headers: $headers)';
  }

  @override
  final String? error;

  @override
  final Map<String, List<dynamic>>? headers;

  @override
  set data(T? data) => data;

  @override
  set headers(Map<String, List<dynamic>>? headers) => headers;

  @override
  set message(String? message) => message;

  @override
  set networkStatus(NetworkStatus? networkStatus) => networkStatus;

  @override
  set statusCode(int? statusCode) => statusCode;
}
