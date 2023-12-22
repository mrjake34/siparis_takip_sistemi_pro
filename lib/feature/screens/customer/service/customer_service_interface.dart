import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';

/// This class is Interface of CustomerService class
sealed class CustomerServiceInterface {
  /// This Function Add Customer to DB
  Future<BaseResponseModel<T>> addCustomer<T>();

  /// This function for fetch Customer List from DB
  Future<BaseResponseModel<T>> getCustomersList<T>();

  /// This function for fetch one customer from db
  Future<BaseResponseModel<T>> getCustomer<T>();

  /// This function for path data of customer
  Future<BaseResponseModel<T>> patchCustomer<T>();

  /// This function detele to customer from Customer List
  Future<BaseResponseModel<T>> deleteCustomer<T>();
}
