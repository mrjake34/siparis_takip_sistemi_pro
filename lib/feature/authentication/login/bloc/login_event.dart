part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class UserLoginEvent extends LoginEvent {
  const UserLoginEvent({this.model});
  final LoginRequestModel? model;
  @override
  List<Object?> get props => [model];
}

class AutoLoginEvent extends LoginEvent {
  const AutoLoginEvent({
    this.autoLogin = true,
    this.cookie,
    this.id,
  });
  final bool autoLogin;
  final String? cookie;
  final String? id;
  @override
  List<Object?> get props => [autoLogin, cookie, id];
}

class LogoutEvent extends LoginEvent {}

final class PasswordVisibilityEvent extends LoginEvent {}
