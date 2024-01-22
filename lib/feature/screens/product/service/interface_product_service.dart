import '../../../../product/core/base/interface/base_network_model.dart';
import '../../../../product/core/base/interface/base_service.dart';
import '../../../../product/core/base/models/base_respose_model.dart';

abstract class IProductService extends BaseService {
  Future<BaseResponseModel<R>> getProducts<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> getProduct<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>> addProduct<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>>
      updateProduct<R, T extends IBaseNetworkModel<T>>();
  Future<BaseResponseModel<R>>
      deleteProduct<R, T extends IBaseNetworkModel<T>>();
}
