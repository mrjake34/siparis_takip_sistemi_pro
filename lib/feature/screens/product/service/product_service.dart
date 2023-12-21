import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/interface_product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../../../product/core/constants/enums/network_status.dart';
import '../model/product.dart';
import '../model/product_list.dart';

final class ProductService extends IProductService {
  @override
  Future<BaseResponseModel<T>> getProducts<T>({
    String? cookie,
  }) async {
    if (cookie == null) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
    final response =
        await ProductItems.networkService.get<BaseResponseModel<Product>>(
      AppNetwork.productPath,
      options: Options(
        headers: {
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
  Future<BaseResponseModel<T>> deleteProduct<T>({
    String? id,
    String? cookie,
  }) async {
    if (id == null || cookie == null) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
    final response = await ProductItems.networkService
        .delete<BaseResponseModel<NetworkStatus>>(
      '${AppNetwork.productPath}/$id',
      options: Options(
        headers: {
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == 200) {
      if (response.data == null) {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.userNotFound,
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      } else {
        return BaseResponseModel<NetworkStatus>(
          data: NetworkStatus.getStatus(response.data! as String),
          statusCode: response.statusCode,
        ) as BaseResponseModel<T>;
      }
    } else {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      ) as BaseResponseModel<T>;
    }
  }

  @override
  Future<BaseResponseModel<T>> addProduct<T>({
    Product? product,
    String? cookie,
  }) async {
    if (product == null || cookie == null) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
    final response = await ProductItems.networkService
        .post<BaseResponseModel<NetworkStatus>>(
      AppNetwork.productPath,
      options: Options(
        headers: {
          'authorization': cookie,
        },
      ),
      data: product.toJson(),
    );
    if (response.data != null) {
      return BaseResponseModel(
        data: NetworkStatus.getStatus(response.data! as String),
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
  Future<BaseResponseModel<T>> getProduct<T>({
    String? id,
    String? cookie,
  }) async {
    if (id == null || cookie == null) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
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
    UpdateModel<ProductEnum>? model,
    String? id,
    String? cookie,
  }) async {
    if (id != null && model != null && cookie != null) {
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
