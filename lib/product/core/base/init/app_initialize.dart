import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/network/network_service.dart';

import '../../../utils/getit/product_manager.dart';

final class AppInitialize {
  AppInitialize._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await _initGetIt();
    await _initSharedManager();
    await _initNetworkService();
    FlutterNativeSplash.remove();
  }

  static Future<void> _initGetIt() async {
    ProductManager.setup();
  }

  static Future<void> _initSharedManager() async {
    await ProductItems.sharedManager.preferencesInit();
  }

  static Future<void> _initNetworkService() async {
    NetworkService.start();
  }
}
