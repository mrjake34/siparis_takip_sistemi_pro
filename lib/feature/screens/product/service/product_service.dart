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
    return ProductItems.networkService.get<T>(
      AppNetwork.productPath,
      model: model,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
    );
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
    return ProductItems.networkService.delete<T>(
      '${AppNetwork.productPath}/$id',
      model: model,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
    );
  }

  @override
  Future<BaseResponseModel<T>> addProduct<T extends IBaseNetworkModel<T>>({
    Product? product,
    String? cookie,
    T? model,
  }) async {
    if (product == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    return ProductItems.networkService.post<T>(
      AppNetwork.productPath,
      model: model,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: product.toJson(),
    );
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
    return ProductItems.networkService.get<T>(
      '${AppNetwork.productPath}/$id',
      model: model,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
    );
  }

  @override
  Future<BaseResponseModel<T>> updateProduct<T extends IBaseNetworkModel<T>>({
    UpdateModel? data,
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || data == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
        statusCode: HttpStatus.badRequest,
      );
    }
    return ProductItems.networkService.put<T>(
      '${AppNetwork.productPath}/$id',
      data: data.toJson(),
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      model: model,
    );
  }
}
