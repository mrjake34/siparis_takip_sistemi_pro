// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i10;
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/view/courier_login_page.dart'
    as _i1;
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/view/login_page.dart'
    as _i3;
import 'package:siparis_takip_sistemi_pro/feature/authentication/password_reset/view/passport_reset.dart'
    as _i4;
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/view/register_page.dart'
    as _i6;
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page_view.dart'
    as _i2;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart'
    as _i9;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/view/profile_page.dart'
    as _i5;
import 'package:siparis_takip_sistemi_pro/feature/screens/splash/view/splash_screen.dart'
    as _i7;

abstract class $RouteManager extends _i8.RootStackRouter {
  $RouteManager({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CourierLoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CourierLoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomePage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    PassReset.name: (routeData) {
      final args =
          routeData.argsAs<PassResetArgs>(orElse: () => const PassResetArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PassReset(key: args.key),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CourierLoginPage]
class CourierLoginRoute extends _i8.PageRouteInfo<void> {
  const CourierLoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CourierLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourierLoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i9.UserResponseModel userModel,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<HomeRouteArgs> page =
      _i8.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i9.UserResponseModel userModel;

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PassReset]
class PassReset extends _i8.PageRouteInfo<PassResetArgs> {
  PassReset({
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          PassReset.name,
          args: PassResetArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PassReset';

  static const _i8.PageInfo<PassResetArgs> page =
      _i8.PageInfo<PassResetArgs>(name);
}

class PassResetArgs {
  const PassResetArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'PassResetArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
