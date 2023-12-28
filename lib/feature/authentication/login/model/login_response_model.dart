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
      message: json['message'] is String
          ? json['message'] as String?
          : json['message'] is Map
              ? Map<String, String>.from(json['message'] as Map) as String?
              : null,
    );
  }

  @override
  List<Object?> get props => [user, message];
}

@JsonSerializable()
final class LoginModel extends IBaseNetworkModel<LoginModel> {
  LoginModel({
    this.id,
    this.shopName,
    this.role,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['Id'] as String?,
      shopName: json['shopName'] as String?,
      role: json['role'] as String?,
    );
  }
  final String? id;
  final String? shopName;
  final String? role;
  @override
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'shopName': shopName,
      'role': role,
    };
  }

  @override
  List<Object?> get props => [id, shopName, role];

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel.fromJson(json);
  }
}
