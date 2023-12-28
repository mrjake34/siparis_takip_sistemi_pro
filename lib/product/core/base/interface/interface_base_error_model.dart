import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

abstract class IBaseErrorModel {
  IBaseErrorModel(this.error);
  final String? error;
}
