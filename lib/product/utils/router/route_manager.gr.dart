// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page_view.dart'
    as _i1;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart'
    as _i4;
import 'package:siparis_takip_sistemi_pro/feature/screens/splash/view/splash_screen.dart'
    as _i2;

abstract class $RouteManager extends _i3.RootStackRouter {
  $RouteManager({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i4.UserModel userModel,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<HomeRouteArgs> page =
      _i3.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i4.UserModel userModel;

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
