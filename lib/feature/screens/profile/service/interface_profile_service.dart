import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

abstract class IProfileService {
  Future<BaseResponseModel<T>> getProfile<T>();
  Future<BaseResponseModel<T>> updateProfile<T>();
}
