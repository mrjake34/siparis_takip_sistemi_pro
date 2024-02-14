import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_respose_model.dart';
import '../../../../product/core/constants/enums/network_status.dart';
import '../../../../product/utils/network/network_service.dart';
import '../model/customer_model.dart';
import 'customer_service_interface.dart';

final class CustomerService extends ICustomerService {
  @override
  Future<BaseResponseModel<T>> addCustomer<T extends IBaseNetworkModel<T>>({
    CustomerModel? customer,
    String? cookie,
    T? model,
  }) async {
    if (customer == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }

    final response = await ProductItems.networkService.request<T>(
      AppNetwork.customerPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.post,
      data: customer.toJson(),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>>
      getCustomersList<T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    if (cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }

    final response = await ProductItems.networkService.request<T>(
      AppNetwork.customerPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> getCustomer<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.request<T>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> patchCustomer<T extends IBaseNetworkModel<T>>({
    UpdateModel? data,
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || data == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }

    final response = await ProductItems.networkService.request<T>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      method: MethodType.put,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> deleteCustomer<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }

    final response = await ProductItems.networkService.request<T>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.delete,
      model: model,
    );
    return response;
  }
}
