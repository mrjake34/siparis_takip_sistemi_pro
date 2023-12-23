import 'package:get_it/get_it.dart';
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
      ..registerSingleton<DeviceInfo>(DeviceInfo.instance);
  }

  static final GetIt _getIt = GetIt.instance;

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
