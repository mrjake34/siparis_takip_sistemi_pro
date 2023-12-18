import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/theme_service.dart';

import '../device_info/device_info.dart';
import '../network/network_service.dart';

final class ProductItems {
  ProductItems._();

  static SharedManager get sharedManager => ProductManager.get<SharedManager>();
  static NetworkService get networkService =>
      ProductManager.get<NetworkService>();
  static ThemeService get themeService => ProductManager.get<ThemeService>();
  static DeviceInfo get deviceInfo => ProductManager.get<DeviceInfo>();
}
