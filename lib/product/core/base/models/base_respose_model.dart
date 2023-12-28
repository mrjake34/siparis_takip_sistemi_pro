import 'package:siparis_takip_sistemi_pro/product/core/base/interface/interface_base_response_model.dart';

import '../../constants/enums/network_status.dart';

/// Base response model for all api responses
final class BaseResponseModel<T> extends IBaseResponseModel<T> {
  /// Base response model contructor method
  BaseResponseModel({
    this.data,
    this.statusCode,
    this.headers,
    this.message,
    this.networkStatus,
    this.cookie,
  });
  final String? cookie;
  @override
  final T? data;
  @override
  final int? statusCode;
  @override
  final String? message;

  final Map<String, List<String>>? headers;
  final NetworkStatus? networkStatus;

  @override
  BaseResponseModel<T> fromJson(Map<String, dynamic> json) {
    return BaseResponseModel<T>(
      data: data,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
    );
  }

  static String? fromError(Map<String, dynamic> json) {
    return json['message'] as String?;
  }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'data': data,
      'statusCode': statusCode,
      'cookie': headers,
      'networkStatus': networkStatus?.name,
      'error': message ?? '',
    };
  }

  @override
  String toString() {
    return 'BaseResponseModel(data: $data, statusCode:'
        ' $statusCode, headers: $headers)';
  }

  @override
  set data(T? data) => data;

  @override
  set message(String? message) => message;

  @override
  set statusCode(int? statusCode) => statusCode;

  @override
  List<Object?> get props => [
        data,
        statusCode,
        headers,
        message,
        networkStatus,
      ];
}
