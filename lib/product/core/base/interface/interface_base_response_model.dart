import 'package:siparis_takip_sistemi_pro/product/core/base/interface/data_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

import 'headers_model.dart';
import 'interface_base_error_model.dart';

abstract class IBaseResponseModel<T>
    implements IBaseErrorModel, IBaseHeaderModel, DataModel<T> {
  NetworkStatus? networkStatus;
  IBaseResponseModel<T> fromJson(Map<String, dynamic> json);
  Map<String, dynamic>? toJson();
}
