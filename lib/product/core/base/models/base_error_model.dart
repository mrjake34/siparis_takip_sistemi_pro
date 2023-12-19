import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';
import 'package:vexana/vexana.dart';

final class BaseErrorModel<T> extends INetworkModel<NetworkErrorModel> {
  BaseErrorModel({required this.error});

  final T error;

  @override
  NetworkErrorModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
