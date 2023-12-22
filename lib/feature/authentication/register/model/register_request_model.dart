import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  RegisterRequestModel({
    this.name,
    this.email,
    this.password,
    this.phone,
    this.shopName,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);

  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? shopName;

  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
