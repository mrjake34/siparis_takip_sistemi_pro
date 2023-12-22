// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
final class LoginResponseModel extends IBaseNetworkModel<LoginResponseModel> {
  LoginResponseModel({this.user});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  final LoginModel? user;
  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return LoginResponseModel.fromJson(json);
  }
}

@JsonSerializable()
class LoginModel {
  const LoginModel({
    required this.id,
    required this.shopName,
    required this.role,
  });
  factory LoginModel.fromJson(Map<String, String> json) =>
      _$LoginModelFromJson(json);
  final String id;
  final String shopName;
  final String role;
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
