part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserDetailsEvent extends UserProfileEvent {
  const FetchUserDetailsEvent({this.user, this.userId});
  final User? user;
  final String? userId;
  @override
  List<Object?> get props => [user, userId];
}

final class UserLogoutEvent extends UserProfileEvent {}
