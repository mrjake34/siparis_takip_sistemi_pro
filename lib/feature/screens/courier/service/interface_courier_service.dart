import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

abstract class ICourierService {
  Future<BaseResponseModel<R>> getCouriers<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> getCourier<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> postCourier<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> putCourier<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>>
      deleteCourier<R, T extends IBaseNetworkModel<T>>();
}
