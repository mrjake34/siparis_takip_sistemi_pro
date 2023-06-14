import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(jsonDecode(str) as Map<String, dynamic>);

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({this.message, this.user});
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].toString();
    if (json['User'] != null) {
      user = UserModel.fromJson(json['User'] as Map<String, String>);
    } else {
      user = null;
    }
  }
  String? message;
  UserModel? user;
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    return data;
  }
}

class UserModel {
  const UserModel({
    required this.id,
    required this.shopName,
    required this.role,
  });
  factory UserModel.fromJson(Map<String, String> json) {
    return UserModel(
      id: json['Id'] ?? '',
      shopName: json['shopName'] ?? '',
      role: json['role'] ?? '',
    );
  }
  final String id;
  final String shopName;
  final String role;
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'shopName': shopName,
      'role': role,
    };
  }
}
