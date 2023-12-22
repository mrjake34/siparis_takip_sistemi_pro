import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

final class RegisterResponseModel
    extends IBaseNetworkModel<RegisterResponseModel> {
  RegisterResponseModel({this.message});

  final String? message;

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }

  @override
  RegisterResponseModel fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      message: json['message'].toString(),
    );
  }
}
