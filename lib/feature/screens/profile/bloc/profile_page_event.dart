part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserDetailsEvent extends ProfilePageEvent {
  const FetchUserDetailsEvent({this.user, this.userId});
  final User? user;
  final String? userId;
  @override
  List<Object?> get props => [user, userId];
}

final class UserLogoutEvent extends ProfilePageEvent {}
