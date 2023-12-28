import 'package:auto_route/auto_route.dart';

import 'route_manager.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')

/// Route manager class
final class RouteManager extends $RouteManager {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: SplashRoute.page,
          path: RoutePath.splashScreen.path,
          initial: true,
        ),
        AdaptiveRoute(
          page: HomeRoute.page,
          path: RoutePath.homeScreen.path,
        ),
        AdaptiveRoute(
          page: LoginRoute.page,
          path: RoutePath.loginScreen.path,
        ),
        AdaptiveRoute(
          page: RegisterRoute.page,
          path: RoutePath.registerScreen.path,
        ),
        AdaptiveRoute(
          page: ProfileRoute.page,
          path: RoutePath.userProfileScreen.path,
        ),
        AdaptiveRoute(
          page: CourierLoginRoute.page,
          path: RoutePath.courierLoginScreen.path,
        ),
      ];
}

/// Route manager enum
enum RoutePath {
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

  /// Courier Login Page
  courierLoginScreen('/courier-login-screen'),

  /// Route manager enum password reset screen
  passwordResetScreen('/password-reset-screen'),
  ;

  const RoutePath(this.path);

  /// Route manager enum path
  final String path;
}
