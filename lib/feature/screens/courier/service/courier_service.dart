import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import 'interface_courier_service.dart';

final class CourierService extends ICourierService {
  @override
  Future<BaseResponseModel<T>> postCourier<T extends IBaseNetworkModel<T>>({
    CourierModel? data,
    String? cookie,
    T? model,
  }) async {
    if (data == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.post<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> putCourier<T extends IBaseNetworkModel<T>>({
    CourierModel? data,
    String? cookie,
    T? model,
  }) async {
    if (data == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.put<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> deleteCourier<T extends IBaseNetworkModel<T>>({
    CourierModel? data,
    String? cookie,
    T? model,
  }) async {
    if (data == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.delete<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> getCourier<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.get<T>(
      '${AppNetwork.courierPath}/$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> getCouriers<T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    if (cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.get<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      model: model,
    );
    return response;
  }
}
