import 'package:json_annotation/json_annotation.dart';
import '../../../../product/core/base/interface/base_network_model.dart';
import 'user_model.dart';

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
  final UserModel? user;

  UserResponseModel copyWith({
    String? message,
    UserModel? user,
  }) =>
      UserResponseModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  @override
  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

  @override
  UserResponseModel fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [message, user];
}
