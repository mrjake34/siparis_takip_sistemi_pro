// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    this.autoLogin,
    this.cookie,
    this.id,
  });
  final bool? autoLogin;
  final String? cookie;
  final String? id;
  @override
  List<Object?> get props => [autoLogin, cookie, id];
}

class LogoutEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

final class PasswordVisibilityEvent extends LoginEvent {}
