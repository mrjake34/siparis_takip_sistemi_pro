import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  const RegisterState({this.status, this.message});
  final Enum? status;
  final String? message;

  @override
  List<Object?> get props => [status, message];

  RegisterState copyWith({
    Enum? status,
    String? message,
  }) {
    return RegisterState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
