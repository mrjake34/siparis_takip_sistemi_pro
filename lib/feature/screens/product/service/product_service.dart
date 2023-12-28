import 'dart:io';

import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/service/interface_product_service.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../../../product/core/constants/enums/network_status.dart';
import '../model/product.dart';

final class ProductService extends IProductService {
  @override
  Future<BaseResponseModel<R>> getProducts<R, T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    if (cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    return ProductItems.networkService.get<R, T>(
      AppNetwork.productPath,
      model: model,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );
  }

  @override
  Future<BaseResponseModel<R>>
      deleteProduct<R, T extends IBaseNetworkModel<T>>({
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
    return ProductItems.networkService.delete<R, T>(
      '${AppNetwork.productPath}/$id',
      model: model,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );
  }

  @override
  Future<BaseResponseModel<R>> addProduct<R, T extends IBaseNetworkModel<T>>({
    Product? product,
    String? cookie,
    T? model,
  }) async {
    if (product == null || cookie == null) {
      return BaseResponseModel<R>(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    return ProductItems.networkService.post<R, T>(
      AppNetwork.productPath,
      model: model,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
      data: product.toJson(),
    );
  }

  @override
  Future<BaseResponseModel<R>> getProduct<R, T extends IBaseNetworkModel<T>>({
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
    return ProductItems.networkService.get<R, T>(
      '${AppNetwork.productPath}/$id',
      model: model,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );
  }

  @override
  Future<BaseResponseModel<R>>
      updateProduct<R, T extends IBaseNetworkModel<T>>({
    UpdateModel? data,
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null && data == null && cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    return ProductItems.networkService.put<R, T>(
      '${AppNetwork.productPath}/$id',
      data: data?.toJson(),
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
      model: model,
    );
  }
}
