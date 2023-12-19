import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';

import '../../../../product/core/base/models/base_respose_model.dart';
import '../../../../product/core/base/models/update_model.dart';

abstract class IProductService {
  Future<BaseResponseModel<T>> getProducts<T>();
  Future<BaseResponseModel<T>> getProduct<T>();
  Future<BaseResponseModel<T>> addProduct<T>();
  Future<BaseResponseModel<T>> updateProduct<T>();
  Future<BaseResponseModel<T>> deleteProduct<T>();
}
