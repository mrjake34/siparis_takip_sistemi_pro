// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status,
    this.validate,
    this.model,
    this.autoLogin,
    this.errorMessage,
    this.networkStatus,
    this.passwordVisibility,
  });
  final Enum? status;
  final Enum? validate;
  final User? model;
  final bool? autoLogin;
  final String? errorMessage;
  final NetworkStatus? networkStatus;
  final bool? passwordVisibility;
  @override
  List<Object?> get props => [
        status,
        validate,
        model,
        autoLogin,
        errorMessage,
        networkStatus,
        passwordVisibility,
      ];

  LoginState copyWith({
    Enum? status,
    Enum? validate,
    User? model,
    bool? autoLogin,
    String? errorMessage,
    NetworkStatus? networkStatus,
    bool? passwordVisibility,
  }) {
    return LoginState(
      status: status ?? this.status,
      validate: validate ?? this.validate,
      model: model ?? this.model,
      autoLogin: autoLogin ?? this.autoLogin,
      errorMessage: errorMessage ?? this.errorMessage,
      networkStatus: networkStatus ?? this.networkStatus,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
    );
  }
}
