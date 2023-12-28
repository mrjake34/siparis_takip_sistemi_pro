import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_respose_model.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/customer.dart';
import 'customer_service_interface.dart';

final class CustomerService extends ICustomerService {
  @override
  Future<BaseResponseModel<R>> addCustomer<R, T extends IBaseNetworkModel<T>>({
    Customer? customer,
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.post<R, T>(
      AppNetwork.customerPath,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
      data: customer?.toJson(),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<R>>
      getCustomersList<R, T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.get<R, T>(
      AppNetwork.customerPath,
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<R>> getCustomer<R, T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService.get<R, T>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<R>>
      patchCustomer<R, T extends IBaseNetworkModel<T>>({
    UpdateModel? data,
    String? id,
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.put<R, T>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      data: data?.toJson(),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<R>>
      deleteCustomer<R, T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.delete<R, T>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      model: model,
    );
    return response;
  }
}
