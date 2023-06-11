// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable {
  const SplashScreenState(
      {this.position, this.locationService, this.status, this.role});
  final Enum? status;
  final String? role;
  final Enum? locationService;
  final Position? position;

  @override
  List<Object?> get props => [status, role, locationService, position];

  SplashScreenState copyWith({
    Enum? status,
    String? role,
    Enum? locationService,
    Position? position,
  }) {
    return SplashScreenState(
      status: status ?? this.status,
      role: role ?? this.role,
      locationService: locationService ?? this.locationService,
      position: position ?? this.position,
    );
  }
}
