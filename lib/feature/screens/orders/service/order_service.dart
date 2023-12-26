import 'package:dio/dio.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/interface/base_network_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/network/url.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';
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
    final response = await ProductItems.networkService.post<T>(
      AppNetwork.orderPath,
      model: model,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
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
    final response = await ProductItems.networkService.get<T>(
      AppNetwork.orderPath,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
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
    if (id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.get<T>(
      AppNetwork.orderPath + id,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
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
    if (id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.delete<T>(
      AppNetwork.orderPath + id,
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
      model: model,
    );
    return response;
  }

  @override
  Future<BaseResponseModel<T>> patchOrder<T extends IBaseNetworkModel<T>>({
    String? id,
    UpdateModel? updateModel,
    String? cookie,
  }) async {
    if (id == null || updateModel == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.put<T>(
      AppNetwork.orderPath + id,
      data: updateModel.toJson(),
      options: Options(
        headers: {
          'authorization': 'Bearer $cookie',
        },
      ),
    );
    return response;
  }
}
