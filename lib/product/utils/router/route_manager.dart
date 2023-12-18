import 'package:auto_route/auto_route.dart';

import 'route_manager.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')

/// Route manager class
final class RouteManager extends $RouteManager {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: SplashRoute.page,
          path: RouteManagerEnum.splashScreen.path,
          initial: true,
        ),
        AdaptiveRoute(
          page: HomeRoute.page,
          path: RouteManagerEnum.homeScreen.path,
        ),
      ];
}

/// Route manager enum
enum RouteManagerEnum {
  /// Route manager enum splash screen
  splashScreen('/'),

  /// Route manager enum login screen
  loginScreen('/login-screen'),

  /// Route manager enum register screen
  registerScreen('/register-screen'),

  /// Route manager enum user profile screen
  userProfileScreen('/user-profile-screen'),

  /// Route manager enum add home screen
  homeScreen('/home-screen'),
  ;

  const RouteManagerEnum(this.path);

  /// Route manager enum path
  final String path;
}
