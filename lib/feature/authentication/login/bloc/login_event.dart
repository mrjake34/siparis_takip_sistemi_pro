// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class DoLoginEvent extends LoginEvent {

  DoLoginEvent();
  @override
  List<Object?> get props => [];
}

class AutoLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];

}
