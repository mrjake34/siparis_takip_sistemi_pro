// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({this.user, this.status, this.networkStatus});
  final User? user;
  final Status? status;
  final NetworkStatus? networkStatus;

  @override
  List<Object?> get props => [user, status, networkStatus];

  UserProfileState copyWith({
    User? user,
    Status? status,
    NetworkStatus? networkStatus,
  }) {
    return UserProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      networkStatus: networkStatus ?? this.networkStatus,
    );
  }
}
