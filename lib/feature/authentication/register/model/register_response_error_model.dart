import '../../../../product/core/base/interface/base_network_model.dart';

final class RegisterResponseModel
    extends IBaseNetworkModel<RegisterResponseModel> {
  RegisterResponseModel({this.message});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
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
  RegisterResponseModel fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel.fromJson(json);
  }

  @override
  List<Object?> get props => [message];
}
