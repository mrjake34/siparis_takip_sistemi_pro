import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final Enum? status;

  const RegisterState({this.status});

  @override
  List<Object?> get props => [status];
}
