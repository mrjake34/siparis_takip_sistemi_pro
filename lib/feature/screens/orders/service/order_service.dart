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
  Future<BaseResponseModel<R>> postOrder<R, T extends IBaseNetworkModel<T>>({
    String? customerId,
    String? orderNote,
    List<dynamic>? orderListPostOut,
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.post<R, T>(
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
  Future<BaseResponseModel<R>> getOrderList<R, T extends IBaseNetworkModel<T>>({
    String? cookie,
    T? model,
  }) async {
    final response = await ProductItems.networkService.get<R, T>(
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
  Future<BaseResponseModel<R>> getOrder<R, T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.get<R, T>(
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
  Future<BaseResponseModel<R>> deleteOrder<R, T extends IBaseNetworkModel<T>>({
    String? id,
    String? cookie,
    T? model,
  }) async {
    if (id == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.delete<R, T>(
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
  Future<BaseResponseModel<R>> patchOrder<R, T extends IBaseNetworkModel<T>>({
    String? id,
    UpdateModel? updateModel,
    String? cookie,
  }) async {
    if (id == null || updateModel == null || cookie == null) {
      return BaseResponseModel(
        networkStatus: NetworkStatus.inputsNotFilled,
      );
    }
    final response = await ProductItems.networkService.put<R, T>(
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
