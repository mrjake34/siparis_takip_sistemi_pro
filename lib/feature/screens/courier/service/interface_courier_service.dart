import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

import '../../../../product/core/base/interface/base_service.dart';

abstract class ICourierService extends BaseService {
  Future<BaseResponseModel<T>> getCouriers<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> getCourier<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> postCourier<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> putCourier<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> deleteCourier<T extends IBaseNetworkModel<T>>();
}
