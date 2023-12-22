import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

final class RegisterResponseSuccessModel
    extends IBaseNetworkModel<RegisterResponseSuccessModel> {
  RegisterResponseSuccessModel({this.message});

  RegisterResponseSuccessModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'].toString();
  }
  String? message;

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Message'] = message;
    return data;
  }

  @override
  RegisterResponseSuccessModel fromJson(Map<String, dynamic> json) {
    return RegisterResponseSuccessModel.fromJson(json);
  }
}
