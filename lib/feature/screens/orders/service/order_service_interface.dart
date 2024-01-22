import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

import '../../../../product/core/base/interface/base_service.dart';

abstract class IOrderService extends BaseService {
  Future<BaseResponseModel<R>> postOrder<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>>
      getOrderList<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> getOrder<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> deleteOrder<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> patchOrder<R, T extends IBaseNetworkModel<T>>();
}
