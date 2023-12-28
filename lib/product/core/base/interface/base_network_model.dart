import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/headers_mixin.dart';

abstract class IBaseNetworkModel<T> extends Equatable with HeadersMixin {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic>? toJson();
}
