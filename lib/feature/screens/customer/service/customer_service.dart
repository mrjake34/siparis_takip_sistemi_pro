import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_respose_model.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/customer.dart';

final class CustomerService {
  Future<BaseResponseModel<T>> addCustomer<T extends IBaseNetworkModel<T>>({
    Customer? customer,
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.post<CustomerList>(
      AppNetwork.customerPath,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
      data: customer?.toJson(),
      model: CustomerList(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel(
          networkStatus: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
        statusCode: response.statusCode,
      );
    }
  }

  Future<BaseResponseModel<T>>
      getCustomersList<T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.get<CustomerList>(
      AppNetwork.customerPath,
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      model: CustomerList(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null ||
          response.data == null ||
          response.data is! Map<String, dynamic>) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        );
      } else {
        if (response.data!.customers == null) {
          return BaseResponseModel(
            networkStatus: NetworkStatus.failedLoadData,
            statusCode: response.statusCode,
          );
        }
        return BaseResponseModel<T>(
          data: response.data!.customers! as T,
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      );
    }
  }

  Future<BaseResponseModel<T>> getCustomer<T extends IBaseNetworkModel<T>>({
    String? id,
  }) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService.get<Customer>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      model: Customer(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel(
          data: response.data as T,
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      );
    }
  }

  Future<BaseResponseModel<T>> patchCustomer<T extends IBaseNetworkModel<T>>({
    UpdateModel? model,
    String? id,
    String? cookie,
  }) async {
    final response = await ProductItems.networkService.put<CustomerList>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
      data: model?.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel(
          networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      );
    }
  }

  Future<BaseResponseModel<T>> deleteCustomer<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
  }) async {
    final response = await ProductItems.networkService.delete<CustomerList>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': 'Bearer $cookie'},
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel(
          networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
          statusCode: response.statusCode,
        );
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      );
    }
  }
}
