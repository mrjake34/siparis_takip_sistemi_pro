import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
final class LoginRequestModel extends IBaseNetworkModel<LoginRequestModel> {
  LoginRequestModel({
    this.email,
    this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
  final String? email;
  final String? password;

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  String toString() {
    return 'LoginRequestModel(email: $email, password: $password)';
  }

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }

  @override
  List<Object?> get props => [email, password];
}
