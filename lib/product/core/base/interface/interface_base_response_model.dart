import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

abstract class IBaseResponseModel<T> {
  IBaseResponseModel({
    this.message,
    this.data,
    this.statusCode,
    this.headers,
    this.networkStatus,
  });
  String? message;
  T? data;
  int? statusCode;
  Map<String, List<dynamic>>? headers;
  NetworkStatus? networkStatus;
  IBaseResponseModel<T> fromJson(Map<String, dynamic> json);
  Map<String, dynamic>? toJson();
}
