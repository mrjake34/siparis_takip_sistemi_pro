import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {

  const RegisterState({this.status});
  final Enum? status;

  @override
  List<Object?> get props => [status];
}
