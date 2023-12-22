// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';

@JsonSerializable()
final class LoginResponseModel extends IBaseNetworkModel<LoginResponseModel> {
  LoginResponseModel({
    this.user,
    this.message,
  });

  final LoginModel? user;
  final String? message;
  @override
  Map<String, dynamic> toJson() {
    return {
      'User': user,
      'message': message,
    };
  }

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: json['User'] == null
          ? null
          : LoginModel.fromJson(Map<String, String>.from(json['User'] as Map)),
      message: json['message'] as String?,
    );
  }
}

@JsonSerializable()
class LoginModel {
  const LoginModel({
    this.id,
    this.shopName,
    this.role,
  });
  factory LoginModel.fromJson(Map<String, String> json) {
    return LoginModel(
      id: json['Id'],
      shopName: json['shopName'],
      role: json['role'],
    );
  }
  final String? id;
  final String? shopName;
  final String? role;
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'shopName': shopName,
      'role': role,
    };
  }
}
