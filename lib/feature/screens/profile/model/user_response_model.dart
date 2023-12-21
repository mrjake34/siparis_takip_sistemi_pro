import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
final class UserResponseModel {
  UserResponseModel({
    this.message,
    this.user,
  });
  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
  final String? message;
  final User? user;

  UserResponseModel copyWith({
    String? message,
    User? user,
  }) =>
      UserResponseModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
