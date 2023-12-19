import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import '../../../../product/core/base/models/base_respose_model.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../model/customer.dart';

class CustomerService {
  Future<T> addCustomer<T>({Customer? customer}) async {
    String? cookie;
    cookie = ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService
        .post<Response<BaseResponseModel<NetworkStatus>>>(
      AppNetwork.customerPath,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: {
        'name': customer?.name,
        'phone': customer?.phone,
        'adress': customer?.adress,
        'latitude': customer?.latitude,
        'longitude': customer?.longitude,
      },
    );
    return response;
  }

  Future<T> getCustomersList<T>() async {
    String? cookie;
    cookie = ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService
        .get<Response<BaseResponseModel<NetworkStatus>>>(
      AppNetwork.customerPath,
      options: Options(
        headers: {'content-type': 'application/json', 'authorization': cookie},
      ),
    );
    if (response.statusCode == 200) {
      final customer =
          CustomerList.fromJson(response.data as Map<String, dynamic>);
      return customer;
    } else {
      throw Exception('Failed to load customer list');
    }
  }

  Future<T> getCustomer<T>(String id) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService
        .get<Response<BaseResponseModel<NetworkStatus>>>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'content-type': 'application/json', 'authorization': cookie},
      ),
    );
    final customer = Customer.fromJson(
      response.data['customer'] as Map<String, dynamic>,
    );
    return customer;
  }

  Future<T> patchCustomer<T>(String key, String value, String id) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await ProductItems.networkService
        .put<Response<BaseResponseModel<NetworkStatus>>>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'content-type': 'application/json', 'authorization': cookie},
      ),
      data: [
        {'propName': key, 'value': value},
      ],
    );
    if (kDebugMode) {
      print(response.statusCode);
    }
  }

  Future<T> deleteCustomer<T>(String id) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response =
        await ProductItems.networkService.delete<Response<NetworkStatus>>(
      '${AppNetwork.customerPath}/$id',
      options: Options(
        headers: {'authorization': cookie},
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      return BaseResponseModel<NetworkStatus>(
        NetworkStatus.getStatus(LocaleKeys.apiMessage_deleteSuccess),
      ) as T;
    } else if (response.statusCode == HttpStatus.unauthorized) {
      return BaseResponseModel<NetworkStatus>(
        NetworkStatus.unauthorized,
      ) as T;
    } else {
      return BaseResponseModel<NetworkStatus>(
        NetworkStatus.getStatus(response.statusMessage ?? ''),
      ) as T;
    }
  }
}
