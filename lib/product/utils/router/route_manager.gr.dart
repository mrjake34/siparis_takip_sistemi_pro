// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i14;
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/view/courier_login_page.dart'
    as _i2;
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/view/login_page.dart'
    as _i6;
import 'package:siparis_takip_sistemi_pro/feature/authentication/password_reset/view/passport_reset.dart'
    as _i7;
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/view/register_page.dart'
    as _i10;
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page_view.dart'
    as _i5;
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart'
    as _i13;
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/edit_order/edit_order_details.dart'
    as _i3;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart'
    as _i15;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/view/add_product/add_product_page.dart'
    as _i1;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/view/edit_product/index.dart'
    as _i4;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/view/product_list/product_list_page.dart'
    as _i8;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user_response_model.dart'
    as _i16;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/view/profile_page.dart'
    as _i9;
import 'package:siparis_takip_sistemi_pro/feature/screens/splash/view/splash_screen.dart'
    as _i11;

abstract class $RouteManager extends _i12.RootStackRouter {
  $RouteManager({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddProductRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddProductPage(),
      );
    },
    CourierLoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CourierLoginPage(),
      );
    },
    EditOrderRoute.name: (routeData) {
      final args = routeData.argsAs<EditOrderRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.EditOrderPage(
          order: args.order,
          key: args.key,
        ),
      );
    },
    EditProductRoute.name: (routeData) {
      final args = routeData.argsAs<EditProductRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.EditProductPage(
          product: args.product,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomePage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginPage(),
      );
    },
    PassReset.name: (routeData) {
      final args =
          routeData.argsAs<PassResetArgs>(orElse: () => const PassResetArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.PassReset(key: args.key),
      );
    },
    ProductListRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProductListPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfilePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddProductPage]
class AddProductRoute extends _i12.PageRouteInfo<void> {
  const AddProductRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AddProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CourierLoginPage]
class CourierLoginRoute extends _i12.PageRouteInfo<void> {
  const CourierLoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CourierLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourierLoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EditOrderPage]
class EditOrderRoute extends _i12.PageRouteInfo<EditOrderRouteArgs> {
  EditOrderRoute({
    required _i13.OrderModel order,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditOrderRoute.name,
          args: EditOrderRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditOrderRoute';

  static const _i12.PageInfo<EditOrderRouteArgs> page =
      _i12.PageInfo<EditOrderRouteArgs>(name);
}

class EditOrderRouteArgs {
  const EditOrderRouteArgs({
    required this.order,
    this.key,
  });

  final _i13.OrderModel order;

  final _i14.Key? key;

  @override
  String toString() {
    return 'EditOrderRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [_i4.EditProductPage]
class EditProductRoute extends _i12.PageRouteInfo<EditProductRouteArgs> {
  EditProductRoute({
    required _i15.Product product,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EditProductRoute.name,
          args: EditProductRouteArgs(
            product: product,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProductRoute';

  static const _i12.PageInfo<EditProductRouteArgs> page =
      _i12.PageInfo<EditProductRouteArgs>(name);
}

class EditProductRouteArgs {
  const EditProductRouteArgs({
    required this.product,
    this.key,
  });

  final _i15.Product product;

  final _i14.Key? key;

  @override
  String toString() {
    return 'EditProductRouteArgs{product: $product, key: $key}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i12.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i16.UserResponseModel userModel,
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<HomeRouteArgs> page =
      _i12.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i16.UserResponseModel userModel;

  final _i14.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PassReset]
class PassReset extends _i12.PageRouteInfo<PassResetArgs> {
  PassReset({
    _i14.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          PassReset.name,
          args: PassResetArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PassReset';

  static const _i12.PageInfo<PassResetArgs> page =
      _i12.PageInfo<PassResetArgs>(name);
}

class PassResetArgs {
  const PassResetArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'PassResetArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ProductListPage]
class ProductListRoute extends _i12.PageRouteInfo<void> {
  const ProductListRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProductListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RegisterPage]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
