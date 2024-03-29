import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

import '../../../../product/core/base/interface/base_service.dart';

/// This class is Interface of CustomerService class
abstract class ICustomerService extends BaseService {
  /// This Function Add Customer to DB
  Future<BaseResponseModel<T>> addCustomer<T extends IBaseNetworkModel<T>>();

  /// This function for fetch Customer List from DB
  Future<BaseResponseModel<T>>
      getCustomersList<T extends IBaseNetworkModel<T>>();

  /// This function for fetch one customer from db
  Future<BaseResponseModel<T>> getCustomer<T extends IBaseNetworkModel<T>>();

  /// This function for path data of customer
  Future<BaseResponseModel<T>> patchCustomer<T extends IBaseNetworkModel<T>>();

  /// This function detele to customer from Customer List
  Future<BaseResponseModel<T>> deleteCustomer<T extends IBaseNetworkModel<T>>();
}
