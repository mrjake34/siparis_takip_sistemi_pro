import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';

final class RegisterSuccessfulModel
    extends IBaseNetworkModel<RegisterSuccessfulModel> {
  RegisterSuccessfulModel({this.message});

  RegisterSuccessfulModel.fromJson(Map<String, dynamic> json) {
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
  RegisterSuccessfulModel fromJson(Map<String, dynamic> json) {
    return RegisterSuccessfulModel.fromJson(json);
  }
}
