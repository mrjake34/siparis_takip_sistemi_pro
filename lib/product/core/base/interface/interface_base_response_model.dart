import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';

abstract class IBaseResponseModel<T> {
  IBaseResponseModel<T> fromJson(Map<String, dynamic> json);
  Map<String, dynamic>? toJson();
  T? data;
  int? statusCode;
  Map<String, List<dynamic>>? headers;
  NetworkErrorModel? error;
}
