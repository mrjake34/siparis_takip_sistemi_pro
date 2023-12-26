// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/network_error_model.dart';

import '../../../../product/core/base/interface/base_network_model.dart';

@JsonSerializable()
final class LoginResponseModel extends IBaseNetworkModel<LoginResponseModel> {
  LoginResponseModel({
    this.user,
    this.error,
  });

  final LoginModel? user;
  final NetworkErrorModel? error;
  @override
  Map<String, dynamic> toJson() {
    return {
      'User': user,
      'message': error?.toJson(),
    };
  }

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: json['User'] == null
          ? null
          : LoginModel.fromJson(Map<String, String>.from(json['User'] as Map)),
      error: json['message'] is String
          ? NetworkErrorModel(message: json['message'] as String?)
          : json['message'] is Map
              ? NetworkErrorModel.fromJson(
                  Map<String, dynamic>.from(json['message'] as Map),
                )
              : null,
    );
  }

  @override
  List<Object?> get props => [user, error];
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
