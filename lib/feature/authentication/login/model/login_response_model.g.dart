// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String?,
      user: json['User'] == null
          ? null
          : LoginModel.fromJson(Map<String, String>.from(json['User'] as Map)),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'User': instance.user,
    };

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      id: json['Id'] as String,
      shopName: json['shopName'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'shopName': instance.shopName,
      'role': instance.role,
    };
