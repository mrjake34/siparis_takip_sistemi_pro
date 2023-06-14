import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  LoginResponseModel({this.message, this.user});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  String? message;
  UserModel? user;
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class UserModel {
  const UserModel({
    required this.id,
    required this.shopName,
    required this.role,
  });
  factory UserModel.fromJson(Map<String, String> json) =>
      _$UserModelFromJson(json);
  final String id;
  final String shopName;
  final String role;
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
