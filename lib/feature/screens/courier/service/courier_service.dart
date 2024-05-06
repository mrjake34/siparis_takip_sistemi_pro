import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/network/network_service.dart';
import 'interface_courier_service.dart';

final class CourierService extends ICourierService {
  CourierService(NetworkService networkService)
      : _networkService = networkService;
  late final NetworkService _networkService;
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
    final response = await _networkService.request<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      method: MethodType.post,
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
    final response = await _networkService.request<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      method: MethodType.put,
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
    final response = await _networkService.request<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      data: data.toJson(),
      method: MethodType.delete,
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
    final response = await _networkService.request<T>(
      '${AppNetwork.courierPath}/$id',
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
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
    final response = await _networkService.request<T>(
      AppNetwork.courierPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      model: model,
    );
    return response;
  }
}
