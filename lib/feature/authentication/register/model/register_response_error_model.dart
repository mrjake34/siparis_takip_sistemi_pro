import '../../../../product/core/base/interface/base_network_model.dart';

final class RegisterResponseErrorModel
    extends IBaseNetworkModel<RegisterResponseErrorModel> {
  RegisterResponseErrorModel({this.message});

  RegisterResponseErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
  }
  String? message;

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }

  @override
  RegisterResponseErrorModel fromJson(Map<String, dynamic> json) {
    return RegisterResponseErrorModel.fromJson(json);
  }
}
