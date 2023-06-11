// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'password_reset_cubit.dart';

class PasswordResetState extends Equatable {
  const PasswordResetState({this.status});
  final Enum? status;

  @override
  List<Object> get props => [status.toString()];

  PasswordResetState copyWith({
    Enum? status,
  }) {
    return PasswordResetState(
      status: status ?? this.status,
    );
  }
}
