// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  LoginResponseModel({this.message, this.User});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  String? message;
  LoginModel? User;
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginModel {
  const LoginModel({
    required this.Id,
    required this.shopName,
    required this.role,
  });
  factory LoginModel.fromJson(Map<String, String> json) =>
      _$LoginModelFromJson(json);
  final String Id;
  final String shopName;
  final String role;
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
