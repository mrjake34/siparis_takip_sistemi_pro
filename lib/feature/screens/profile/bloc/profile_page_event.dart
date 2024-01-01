part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserDetailsEvent extends ProfilePageEvent {
  const FetchUserDetailsEvent({this.userId, this.cookie});

  final String? userId;
  final String? cookie;
  @override
  List<Object?> get props => [userId, cookie];
}

final class UserLogoutEvent extends ProfilePageEvent {}
