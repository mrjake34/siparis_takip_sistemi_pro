// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/view/courier_login.dart'
    as _i1;
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/view/login_page.dart'
    as _i3;
import 'package:siparis_takip_sistemi_pro/feature/authentication/password_reset/view/passport_reset.dart'
    as _i4;
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/view/signup_page.dart'
    as _i5;
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page_view.dart'
    as _i2;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart'
    as _i9;
import 'package:siparis_takip_sistemi_pro/feature/screens/splash/view/splash_screen.dart'
    as _i6;

abstract class $RouteManager extends _i7.RootStackRouter {
  $RouteManager({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    CourierLoginRoute.name: (routeData) {
      final args = routeData.argsAs<CourierLoginRouteArgs>(
          orElse: () => const CourierLoginRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CourierLoginPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomePage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginPage(key: args.key),
      );
    },
    PassReset.name: (routeData) {
      final args =
          routeData.argsAs<PassResetArgs>(orElse: () => const PassResetArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.PassReset(key: args.key),
      );
    },
    SignUpWidget.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpWidget(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CourierLoginPage]
class CourierLoginRoute extends _i7.PageRouteInfo<CourierLoginRouteArgs> {
  CourierLoginRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          CourierLoginRoute.name,
          args: CourierLoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CourierLoginRoute';

  static const _i7.PageInfo<CourierLoginRouteArgs> page =
      _i7.PageInfo<CourierLoginRouteArgs>(name);
}

class CourierLoginRouteArgs {
  const CourierLoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'CourierLoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i9.UserResponseModel userModel,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<HomeRouteArgs> page =
      _i7.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i9.UserResponseModel userModel;

  final _i8.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<LoginRouteArgs> page =
      _i7.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.PassReset]
class PassReset extends _i7.PageRouteInfo<PassResetArgs> {
  PassReset({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          PassReset.name,
          args: PassResetArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PassReset';

  static const _i7.PageInfo<PassResetArgs> page =
      _i7.PageInfo<PassResetArgs>(name);
}

class PassResetArgs {
  const PassResetArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'PassResetArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignUpWidget]
class SignUpWidget extends _i7.PageRouteInfo<void> {
  const SignUpWidget({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpWidget.name,
          initialChildren: children,
        );

  static const String name = 'SignUpWidget';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
