import 'package:get_it/get_it.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/service/courier_login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/service/register_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/service/courier_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/service/customer_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/service/order_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/service/profile_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/device_info/device_info.dart';

import '../../theme/theme_service.dart';
import '../network/network_service.dart';

final class ProductManager {
  ProductManager._();

  static void setup() {
    _getIt
      ..registerSingleton<SharedManager>(SharedManager.instance)
      ..registerSingleton<NetworkService>(NetworkService.instance)
      ..registerSingleton<ThemeService>(ThemeService.instance)
      ..registerSingleton<DeviceInfo>(DeviceInfo.instance)
      ..registerFactory(() => CustomerService(_getIt()))
      ..registerFactory(() => NetworkService.instance)
      ..registerFactory(() => ProfileService(_getIt()))
      ..registerFactory(() => ProductService(_getIt()))
      ..registerFactory(() => CourierLoginService(_getIt()))
      ..registerFactory(() => CourierService(_getIt()))
      ..registerFactory(() => RegisterService(_getIt()))
      ..registerFactory(() => LoginService(_getIt()))
      ..registerFactory(() => OrderService(_getIt()));
  }

  final getItNew = GetIt.asNewInstance();

  static final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt<T>();
}
