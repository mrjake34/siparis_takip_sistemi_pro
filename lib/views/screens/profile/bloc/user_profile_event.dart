part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserDetailsEvent extends UserProfileEvent {
  final User? user;
  final String? userId;

  const FetchUserDetailsEvent({this.user, this.userId});
  @override
  List<Object?> get props => [user, userId];
}
