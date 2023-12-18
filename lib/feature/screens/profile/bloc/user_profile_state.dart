// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({this.user, this.status});
  final UserModel? user;
  final Status? status;

  @override
  List<Object?> get props => [user, status];

  UserProfileState copyWith({
    UserModel? user,
    Status? status,
  }) {
    return UserProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }
}
