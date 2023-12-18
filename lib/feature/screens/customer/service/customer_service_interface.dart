import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/customer.dart';

/// This class is Interface of CustomerService class
sealed class CustomerServiceInterface {
  /// This Function Add Customer to DB
  Future<T> addCustomer<T>(Object value);

  /// This function for fetch Customer List from DB
  Future<T> getCustomersList<T>(Object value);

  /// This function for fetch one customer from db
  Future<T> getCustomer<T>(Object value);

  /// This function for path data of customer
  Future<T> patchCustomer<T>(CustomerEnum key, String value, String id);

  /// This function detele to customer from Customer List
  Future<T> deleteCustomer<T>(String id);
}
