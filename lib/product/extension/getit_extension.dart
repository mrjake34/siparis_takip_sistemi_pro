import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_manager.dart';

extension ProductManagerExtension on BuildContext {
  T get<T extends Object>() => ProductManager.get<T>();
}
