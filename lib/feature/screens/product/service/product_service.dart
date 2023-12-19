import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/interface_product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/enums/network_status.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../model/product.dart';

final class ProductService extends IProductService {
  @override
  Future<BaseResponseModel<T>> getProducts<T>() async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response =
        await ProductItems.networkService.get<BaseResponseModel<Product>>(
      AppNetwork.productPath,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );

    if (response.statusCode == 200) {
      if (response.data == null || response.data?.data == null) {
        return BaseResponseModel(
          data: NetworkStatus.userNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        final productList =
            ProductList.fromJson(response.data!.data! as Map<String, dynamic>);
        return BaseResponseModel(
          data: productList,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else {
      return BaseResponseModel(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  @override
  Future<BaseResponseModel<T>> deleteProduct<T>({String? id}) async {
    if (id == null) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await ProductItems.networkService
        .delete<BaseResponseModel<NetworkStatus>>(
      '${AppNetwork.productPath}/$id',
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == 200) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.getStatus(response.data as String),
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  @override
  Future<BaseResponseModel<T>> addProduct<T>({Product? product}) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await ProductItems.networkService
        .post<BaseResponseModel<NetworkStatus>>(
      AppNetwork.productPath,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: product?.toJson(),
    );
    if (response.data != null) {
      return BaseResponseModel(
        data: NetworkStatus.getStatus(response.data as String),
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  @override
  Future<BaseResponseModel<T>> getProduct<T>({String? id}) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);

    final response =
        await ProductItems.networkService.get<BaseResponseModel<Product>>(
      '${AppNetwork.productPath}/$id',
      options: Options(
        headers: {
          'authorization': cookie,
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      final product = Product.fromJson(
        response.data!.data! as Map<String, dynamic>,
      );

      return BaseResponseModel(
        data: product,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    } else {
      return BaseResponseModel(
        data: NetworkStatus.getStatus(response.data! as String),
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  @override
  Future<BaseResponseModel<T>> updateProduct<T>({
    UpdateModel<PatchProductEnums>? model,
    String? id,
  }) async {
    final cookie =
        ProductItems.sharedManager.getStringValue(PreferenceKey.cookie);
    if (id != null && model != null) {
      final response = await ProductItems.networkService
          .put<BaseResponseModel<NetworkStatus>>(
        '${AppNetwork.productPath}/$id',
        data: model.toJson(),
        options: Options(
          headers: {
            'authorization': cookie,
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return BaseResponseModel(
          data: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel(
          data: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else {
      return BaseResponseModel(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
  }
}
