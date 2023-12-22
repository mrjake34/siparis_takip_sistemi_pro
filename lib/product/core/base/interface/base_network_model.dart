import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';

abstract class IBaseNetworkModel<T> {
  Map<String, dynamic>? toJson();
  T fromJson(Map<String, dynamic> json);
}
