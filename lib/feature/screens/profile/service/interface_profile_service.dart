import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

abstract class IProfileService {
  Future<BaseResponseModel<T>> getProfile<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> updateProfile<T extends IBaseNetworkModel<T>>();
}
