import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

import '../../../../product/core/base/interface/base_service.dart';

abstract class IOrderService extends BaseService {
  Future<BaseResponseModel<T>> postOrder<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> getOrderList<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> getOrder<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> deleteOrder<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> patchOrder<T extends IBaseNetworkModel<T>>();
}
