// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.status, this.validate, this.model, this.autoLogin});
  final Enum? status;
  final Enum? validate;
  final User? model;
  final Enum? autoLogin;
  @override
  List<Object?> get props => [status, validate, model, autoLogin];

  LoginState copyWith({
    Enum? status,
    Enum? validate,
    User? model,
    Enum? autoLogin,
  }) {
    return LoginState(
      status: status ?? this.status,
      validate: validate ?? this.validate,
      model: model ?? this.model,
      autoLogin: autoLogin ?? this.autoLogin,
    );
  }
}
