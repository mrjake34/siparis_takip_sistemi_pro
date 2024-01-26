import '../../../../product/core/base/interface/base_network_model.dart';
import '../../../../product/core/base/interface/base_service.dart';
import '../../../../product/core/base/models/base_respose_model.dart';

abstract class IProductService extends BaseService {
  Future<BaseResponseModel<T>> getProducts<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> getProduct<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> addProduct<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> updateProduct<T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<T>> deleteProduct<T extends IBaseNetworkModel<T>>();
}
