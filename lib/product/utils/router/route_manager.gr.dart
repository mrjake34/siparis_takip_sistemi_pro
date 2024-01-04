// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i21;
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/view/courier_login_page.dart'
    as _i5;
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/view/login_page.dart'
    as _i12;
import 'package:siparis_takip_sistemi_pro/feature/authentication/password_reset/view/password_reset_page.dart'
    as _i14;
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/view/register_page.dart'
    as _i17;
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_model.dart'
    as _i20;
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/view/courier_list/courier_list_page.dart'
    as _i4;
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/view/edit_courier/edit_courier_page.dart'
    as _i7;
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer.dart'
    as _i22;
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/view/add_customer/add_customer_page.dart'
    as _i1;
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/view/customer_list/customer_list_page.dart'
    as _i6;
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/view/edit_customer/edit_customer.dart'
    as _i8;
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page.dart'
    as _i11;
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart'
    as _i23;
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/add_order/add_order.dart'
    as _i2;
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/edit_order/edit_order_details.dart'
    as _i9;
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/views/order_lists/order_list_page.dart'
    as _i13;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart'
    as _i24;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/view/add_product/add_product_page.dart'
    as _i3;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/view/edit_product/index.dart'
    as _i10;
import 'package:siparis_takip_sistemi_pro/feature/screens/product/view/product_list/product_list_page.dart'
    as _i15;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart'
    as _i25;
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/view/profile_page.dart'
    as _i16;
import 'package:siparis_takip_sistemi_pro/feature/screens/splash/view/splash_screen.dart'
    as _i18;

abstract class $RouteManager extends _i19.RootStackRouter {
  $RouteManager({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AddCustomerRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddCustomerPage(),
      );
    },
    AddOrder.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddOrder(),
      );
    },
    AddProductRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddProductPage(),
      );
    },
    CourierListRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CourierListPage(),
      );
    },
    CourierLoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.CourierLoginPage(),
      );
    },
    CustomerListRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.CustomerListPage(),
      );
    },
    EditCourierRoute.name: (routeData) {
      final args = routeData.argsAs<EditCourierRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.EditCourierPage(
          courierModel: args.courierModel,
          key: args.key,
        ),
      );
    },
    EditCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<EditCustomerRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.EditCustomerPage(
          customer: args.customer,
          key: args.key,
        ),
      );
    },
    EditOrderRoute.name: (routeData) {
      final args = routeData.argsAs<EditOrderRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.EditOrderPage(
          order: args.order,
          key: args.key,
        ),
      );
    },
    EditProductRoute.name: (routeData) {
      final args = routeData.argsAs<EditProductRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.EditProductPage(
          product: args.product,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.HomePage(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LoginPage(),
      );
    },
    OrderListRoute.name: (routeData) {
      final args = routeData.argsAs<OrderListRouteArgs>(
          orElse: () => const OrderListRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.OrderListPage(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
    PassResetRoute.name: (routeData) {
      final args = routeData.argsAs<PassResetRouteArgs>(
          orElse: () => const PassResetRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.PassResetPage(key: args.key),
      );
    },
    ProductListRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ProductListPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RegisterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCustomerPage]
class AddCustomerRoute extends _i19.PageRouteInfo<void> {
  const AddCustomerRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AddCustomerRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCustomerRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddOrder]
class AddOrder extends _i19.PageRouteInfo<void> {
  const AddOrder({List<_i19.PageRouteInfo>? children})
      : super(
          AddOrder.name,
          initialChildren: children,
        );

  static const String name = 'AddOrder';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddProductPage]
class AddProductRoute extends _i19.PageRouteInfo<void> {
  const AddProductRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AddProductRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddProductRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CourierListPage]
class CourierListRoute extends _i19.PageRouteInfo<void> {
  const CourierListRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CourierListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourierListRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CourierLoginPage]
class CourierLoginRoute extends _i19.PageRouteInfo<void> {
  const CourierLoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CourierLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'CourierLoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.CustomerListPage]
class CustomerListRoute extends _i19.PageRouteInfo<void> {
  const CustomerListRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CustomerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerListRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.EditCourierPage]
class EditCourierRoute extends _i19.PageRouteInfo<EditCourierRouteArgs> {
  EditCourierRoute({
    required _i20.CourierModel courierModel,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditCourierRoute.name,
          args: EditCourierRouteArgs(
            courierModel: courierModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCourierRoute';

  static const _i19.PageInfo<EditCourierRouteArgs> page =
      _i19.PageInfo<EditCourierRouteArgs>(name);
}

class EditCourierRouteArgs {
  const EditCourierRouteArgs({
    required this.courierModel,
    this.key,
  });

  final _i20.CourierModel courierModel;

  final _i21.Key? key;

  @override
  String toString() {
    return 'EditCourierRouteArgs{courierModel: $courierModel, key: $key}';
  }
}

/// generated route for
/// [_i8.EditCustomerPage]
class EditCustomerRoute extends _i19.PageRouteInfo<EditCustomerRouteArgs> {
  EditCustomerRoute({
    required _i22.Customer? customer,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditCustomerRoute.name,
          args: EditCustomerRouteArgs(
            customer: customer,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCustomerRoute';

  static const _i19.PageInfo<EditCustomerRouteArgs> page =
      _i19.PageInfo<EditCustomerRouteArgs>(name);
}

class EditCustomerRouteArgs {
  const EditCustomerRouteArgs({
    required this.customer,
    this.key,
  });

  final _i22.Customer? customer;

  final _i21.Key? key;

  @override
  String toString() {
    return 'EditCustomerRouteArgs{customer: $customer, key: $key}';
  }
}

/// generated route for
/// [_i9.EditOrderPage]
class EditOrderRoute extends _i19.PageRouteInfo<EditOrderRouteArgs> {
  EditOrderRoute({
    required _i23.OrderModel order,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditOrderRoute.name,
          args: EditOrderRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditOrderRoute';

  static const _i19.PageInfo<EditOrderRouteArgs> page =
      _i19.PageInfo<EditOrderRouteArgs>(name);
}

class EditOrderRouteArgs {
  const EditOrderRouteArgs({
    required this.order,
    this.key,
  });

  final _i23.OrderModel order;

  final _i21.Key? key;

  @override
  String toString() {
    return 'EditOrderRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [_i10.EditProductPage]
class EditProductRoute extends _i19.PageRouteInfo<EditProductRouteArgs> {
  EditProductRoute({
    required _i24.Product product,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditProductRoute.name,
          args: EditProductRouteArgs(
            product: product,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProductRoute';

  static const _i19.PageInfo<EditProductRouteArgs> page =
      _i19.PageInfo<EditProductRouteArgs>(name);
}

class EditProductRouteArgs {
  const EditProductRouteArgs({
    required this.product,
    this.key,
  });

  final _i24.Product product;

  final _i21.Key? key;

  @override
  String toString() {
    return 'EditProductRouteArgs{product: $product, key: $key}';
  }
}

/// generated route for
/// [_i11.HomePage]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    required _i25.User userModel,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<HomeRouteArgs> page =
      _i19.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i25.User userModel;

  final _i21.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i12.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrderListPage]
class OrderListRoute extends _i19.PageRouteInfo<OrderListRouteArgs> {
  OrderListRoute({
    _i21.Key? key,
    int? pageIndex,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          OrderListRoute.name,
          args: OrderListRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderListRoute';

  static const _i19.PageInfo<OrderListRouteArgs> page =
      _i19.PageInfo<OrderListRouteArgs>(name);
}

class OrderListRouteArgs {
  const OrderListRouteArgs({
    this.key,
    this.pageIndex,
  });

  final _i21.Key? key;

  final int? pageIndex;

  @override
  String toString() {
    return 'OrderListRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [_i14.PassResetPage]
class PassResetRoute extends _i19.PageRouteInfo<PassResetRouteArgs> {
  PassResetRoute({
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          PassResetRoute.name,
          args: PassResetRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PassResetRoute';

  static const _i19.PageInfo<PassResetRouteArgs> page =
      _i19.PageInfo<PassResetRouteArgs>(name);
}

class PassResetRouteArgs {
  const PassResetRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'PassResetRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.ProductListPage]
class ProductListRoute extends _i19.PageRouteInfo<void> {
  const ProductListRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProductListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductListRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.RegisterPage]
class RegisterRoute extends _i19.PageRouteInfo<void> {
  const RegisterRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
