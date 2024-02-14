import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
import '../../../../product/utils/network/network_service.dart';
import 'order_service_interface.dart';

final class OrderService extends IOrderService {
  @override
  Future<BaseResponseModel<T>> postOrder<T extends IBaseNetworkModel<T>>({
    String? customerId,
    String? orderNote,
    List<dynamic>? orderListPostOut,
    String? cookie,
    T? model,
  }) async {
    if (customerId == null ||
        orderNote == null ||
        orderListPostOut == null ||
        cookie == null ||
        model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.request<T>(
      AppNetwork.orderPath,
      model: model,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      data: {
        'customerId': customerId,
        'orderNote': orderNote,
        'orderListPostOut': orderListPostOut,
      },
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> getOrderList<T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    if (cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }

    final response = await ProductItems.networkService.request<T>(
      AppNetwork.orderPath,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> getOrder<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.request<T>(
      AppNetwork.orderPath + id,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.get,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> deleteOrder<T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.request<T>(
      AppNetwork.orderPath + id,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.delete,
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> patchOrder<T extends IBaseNetworkModel<T>>({
    String? id,
    UpdateModel? updateModel,
    String? cookie,
    T? model,
  }) async {
    if (id == null || updateModel == null || cookie == null || model == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.request<T>(
      AppNetwork.orderPath + id,
      data: updateModel.toJson(),
      model: model,
      options: Options(
        headers: setHeaderWithCookie(cookie),
      ),
      method: MethodType.put,
    );
    return response;
  }
}
