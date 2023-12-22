import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product_list.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/interface_product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../../../product/core/constants/enums/network_status.dart';
import '../../../authentication/register/model/register_response_model.dart';
import '../model/product.dart';

final class ProductService extends IProductService {
  @override
  Future<BaseResponseModel<T>> getProducts<T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    if (cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    final response = await ProductItems.networkService.get<ProductList>(
      AppNetwork.productPath,
      model: ProductList(),
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );

    if (response.statusCode == 200) {
      if (response.data == null || response.data == null) {
        return BaseResponseModel(
          networkStatus: NetworkStatus.userNotFound,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel<T>(
          data: response.data as T?,
          statusCode: response.statusCode,
        );
      }
    } else {
      return BaseResponseModel<T>(
        networkStatus:
            NetworkStatus.getStatusFromCode(response.statusCode ?? 0),
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<BaseResponseModel<T>> deleteProduct<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    final response =
        await ProductItems.networkService.delete<ProductResponseModel>(
      '${AppNetwork.productPath}/$id',
      model: ProductResponseModel(),
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );
    if (response.statusCode == 200) {
      if (response.statusCode == HttpStatus.ok) {
        return BaseResponseModel<T>(
          networkStatus: NetworkStatus.deleteSuccess,
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel<T>(
          networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
          statusCode: response.statusCode,
        );
      }
    } else {
      return BaseResponseModel<T>(
        networkStatus: NetworkStatus.unknownError,
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<BaseResponseModel<T>> addProduct<T extends IBaseNetworkModel<T>>({
    Product? product,
    String? cookie,
    T? model,
  }) async {
    if (product == null || cookie == null) {
      return BaseResponseModel<NetworkStatus>(
        data: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      ) as BaseResponseModel<T>;
    }
    final response =
        await ProductItems.networkService.post<ProductResponseModel>(
      AppNetwork.productPath,
      model: ProductResponseModel(),
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
      data: product.toJson(),
    );
    if (response.statusCode == HttpStatus.ok) {
      return BaseResponseModel<T>(
        networkStatus: NetworkStatus.createdSuccess,
        statusCode: response.statusCode,
      );
    } else if (response.data != null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel<T>(
        networkStatus: NetworkStatus.productNotFound,
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<BaseResponseModel<T>> getProduct<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    final response =
        await ProductItems.networkService.get<ProductResponseModel>(
      '${AppNetwork.productPath}/$id',
      model: ProductResponseModel(),
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.success,
        statusCode: response.statusCode,
      );
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.getStatus(response.data! as String),
        statusCode: response.statusCode,
      );
    }
  }

  @override
  Future<BaseResponseModel<T>> updateProduct<T extends IBaseNetworkModel<T>>({
    UpdateModel<ProductEnum>? data,
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id != null && data != null && cookie != null) {
      final response =
          await ProductItems.networkService.put<RegisterResponseModel>(
        '${AppNetwork.productPath}/$id',
        data: data.toJson(),
        options: Options(
          headers: {
            'authorization': 'Bearer $cookie',
          },
        ),
        model: RegisterResponseModel(),
      );
      if (response.statusCode == HttpStatus.ok) {
        return BaseResponseModel(
          statusCode: response.statusCode,
        );
      } else {
        return BaseResponseModel<T>(
          networkStatus: NetworkStatus.getStatus(response.data?.message ?? ''),
          statusCode: response.statusCode,
        );
      }
    } else {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
  }
}
