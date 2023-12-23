import 'package:equatable/equatable.dart';

import '../../../../product/core/constants/enums/enums.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.status,
    this.message,
    this.agreementCheck,
    this.passwordVisibility,
    this.passwordAgainVisibility,
  });
  final Status? status;
  final String? message;
  final bool? agreementCheck;
  final bool? passwordVisibility;
  final bool? passwordAgainVisibility;

  @override
  List<Object?> get props => [
        status,
        message,
        agreementCheck,
        passwordVisibility,
        passwordAgainVisibility,
      ];

  RegisterState copyWith({
    Status? status,
    String? message,
    bool? agreementCheck,
    bool? passwordVisibility,
    bool? passwordAgainVisibility,
  }) {
    return RegisterState(
      status: status ?? this.status,
      message: message ?? this.message,
      agreementCheck: agreementCheck ?? this.agreementCheck,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      passwordAgainVisibility:
          passwordAgainVisibility ?? this.passwordAgainVisibility,
    );
  }
}
