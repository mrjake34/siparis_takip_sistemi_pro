// ignore_for_file: no_default_cases

import 'package:siparis_takip_sistemi_pro/core/constants/enums/network_enums.dart';

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
