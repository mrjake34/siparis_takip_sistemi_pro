import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_respose_model.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/customer.dart';

class CustomerService {
  Future<BaseResponseModel<T>> addCustomer<T>({
    Customer? customer,
    String? cookie,
  }) async {
    final response = await ProductItems.networkService
        .post<Response<BaseResponseModel<NetworkStatus>>>(
      AppNetwork.customerPath,
      options: Options(
        headers: {
          'authorization': cookie,
        },
      ),
      data: customer?.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.getStatus(response.data! as String),
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  Future<BaseResponseModel<T>> getCustomersList<T>({String? cookie}) async {
    final response =
        await ProductItems.networkService.get<BaseResponseModel<CustomerList>>(
      AppNetwork.customerPath,
      options: Options(
        headers: {'authorization': cookie},
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null ||
          response.data?.data == null ||
          response.data?.data is! Map<String, dynamic>) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        final customerList =
            CustomerList.fromJson(response.data!.data! as Map<String, dynamic>);
        return BaseResponseModel<CustomerList>(
          data: customerList,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  Future<BaseResponseModel<T>> getCustomer<T>({String? id}) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response =
        await ProductItems.networkService.get<BaseResponseModel<Customer>>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': cookie},
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel<Customer>(
          data: Customer.fromJson(
            response.data!.data! as Map<String, dynamic>,
          ),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  Future<BaseResponseModel<T>> patchCustomer<T>({
    UpdateModel<dynamic>? model,
    String? id,
  }) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await ProductItems.networkService
        .put<Response<BaseResponseModel<NetworkStatus>>>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': cookie},
      ),
      data: model?.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  Future<BaseResponseModel<T>> deleteCustomer<T>(String id) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService
        .delete<BaseResponseModel<NetworkStatus>>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': cookie},
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.data == null) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.customerNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unauthorized,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }
}
