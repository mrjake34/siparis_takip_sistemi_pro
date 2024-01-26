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
    this.cookie,
    this.userStatus,
  });
  final Status? status;
  final Validate? validate;
  final UserModel? model;
  final AutoLogin? autoLogin;
  final String? errorMessage;
  final NetworkStatus? networkStatus;
  final bool? passwordVisibility;
  final String? cookie;
  final UserStatus? userStatus;
  @override
  List<Object?> get props => [
        status,
        validate,
        model,
        autoLogin,
        errorMessage,
        networkStatus,
        passwordVisibility,
        cookie,
        userStatus,
      ];

  LoginState copyWith({
    Status? status,
    Validate? validate,
    UserModel? model,
    AutoLogin? autoLogin,
    String? errorMessage,
    NetworkStatus? networkStatus,
    bool? passwordVisibility,
    String? cookie,
    UserStatus? userStatus,
  }) {
    return LoginState(
      status: status ?? this.status,
      validate: validate ?? this.validate,
      model: model ?? this.model,
      autoLogin: autoLogin ?? this.autoLogin,
      errorMessage: errorMessage ?? this.errorMessage,
      networkStatus: networkStatus ?? this.networkStatus,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      cookie: cookie ?? this.cookie,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}
