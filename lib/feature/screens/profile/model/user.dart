import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
final class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.shopName,
    this.role,
    this.paymentStatus,
    this.createdAt,
    this.updatedAt,
    this.ip,
    this.refreshToken,
    this.message,
  });
  const User.empty() : this();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? shopName;
  final String? role;
  final bool? paymentStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? ip;
  final String? refreshToken;
  final String? message;

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? shopName,
    String? role,
    bool? paymentStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ip,
    String? refreshToken,
    String? message,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        shopName: shopName ?? this.shopName,
        role: role ?? this.role,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ip: ip ?? this.ip,
        refreshToken: refreshToken ?? this.refreshToken,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User fromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        phone,
        shopName,
        role,
        paymentStatus,
        createdAt,
        updatedAt,
        ip,
        refreshToken,
        message,
      ];
}
