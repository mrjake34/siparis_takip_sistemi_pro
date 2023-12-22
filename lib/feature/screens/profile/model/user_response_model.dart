import 'package:json_annotation/json_annotation.dart';
import '../../../../product/core/base/interface/base_network_model.dart';
import 'user.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
final class UserResponseModel extends IBaseNetworkModel<UserResponseModel> {
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

  @override
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  @override
  UserResponseModel fromJson(Map<String, dynamic> json) {
    return UserResponseModel.fromJson(json);
  }
}
