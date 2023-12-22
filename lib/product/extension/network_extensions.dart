// ignore_for_file: no_default_cases

import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

extension NetworkTypeExtension on HttpTypes? {
  String? get rawValue {
    switch (this) {
      case HttpTypes.get:
        return 'GET';
      case HttpTypes.post:
        return 'POST';
      case HttpTypes.delete:
        return 'DELETE';
      default:
        return null;
    }
  }
}
