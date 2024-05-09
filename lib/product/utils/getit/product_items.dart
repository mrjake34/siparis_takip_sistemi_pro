import 'package:siparis_takip_sistemi_pro/feature/authentication/courier_login/service/courier_login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/login/service/login_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/authentication/register/service/register_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/service/courier_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/product_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/service/profile_service.dart';
import 'package:siparis_takip_sistemi_pro/product/theme/theme_service.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/cache/shared_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/snackbar/snackbar.dart';
import '../../../feature/screens/customer/service/customer_service.dart';
import '../../../feature/screens/orders/service/order_service.dart';
import '../device_info/device_info.dart';

final class ProductItems {
  ProductItems._();

  static SharedManager get sharedManager => ProductManager.get<SharedManager>();
  static ThemeService get themeService => ProductManager.get<ThemeService>();
  static DeviceInfo get deviceInfo => ProductManager.get<DeviceInfo>();
  static CustomerService get customerService =>
      ProductManager.get<CustomerService>();
  static ProfileService get profileService =>
      ProductManager.get<ProfileService>();
  static ProductService get productService =>
      ProductManager.get<ProductService>();
  static CourierLoginService get courierLoginService =>
      ProductManager.get<CourierLoginService>();
  static OrderService get orderService => ProductManager.get<OrderService>();
  static CourierService get courierService =>
      ProductManager.get<CourierService>();
  static RegisterService get registerService =>
      ProductManager.get<RegisterService>();
  static LoginService get loginService => ProductManager.get<LoginService>();
  static CustomSnackBar get customSnackBar =>
      ProductManager.get<CustomSnackBar>();
}
