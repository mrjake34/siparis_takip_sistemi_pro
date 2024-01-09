// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_page_bloc.dart';

class ProfilePageState extends Equatable {
  const ProfilePageState({
    this.user,
    this.status,
    this.networkStatus,
  });
  final UserModel? user;
  final Status? status;
  final NetworkStatus? networkStatus;

  @override
  List<Object?> get props => [
        user,
        status,
        networkStatus,
      ];

  ProfilePageState copyWith({
    UserModel? user,
    Status? status,
    NetworkStatus? networkStatus,
    ThemeData? theme,
  }) {
    return ProfilePageState(
      user: user ?? this.user,
      status: status ?? this.status,
      networkStatus: networkStatus ?? this.networkStatus,
    );
  }
}
