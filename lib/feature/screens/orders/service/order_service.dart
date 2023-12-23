import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import '../../../../product/core/base/models/base_model_view.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../model/order.dart';
import 'order_service_interface.dart';
import 'package:vexana/vexana.dart';

final class OrderService extends IOrderService {
  OrderService();
  @override
  Future<dynamic> postOrder(
    String customerId,
    String orderNote,
    List<dynamic> orderListPostOut,
  ) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final body = jsonEncode({
      'customerId': customerId,
      'orderNote': orderNote,
      'products': orderListPostOut
    });
    final response = await networkService.dio.post(
      appNetwork.postOrderUrl,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
      data: body,
    );
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_orderAdded.tr());
    } else {
      utils.errorSnackBar(LocaleKeys.errors_emailAlreadyExists.tr());
    }
  }

  @override
  Future<OrderList?> getOrderList({String? cookie}) async {
    cookie ??= sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.get(
      appNetwork.postOrderUrl,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      final orderList =
          OrderList.fromJson(response.data as Map<String, dynamic>);
      return orderList;
    } else if (response.statusCode == HttpStatus.badRequest) {
      return null;
    } else {
      return null;
    }
  }

  @override
  Future<OrderListProduct> getOrder(String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.get(
      appNetwork.getOrderUrl + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    final order =
        OrderListProduct.fromJson(response.data as Map<String, dynamic>);
    return order;
  }

  @override
  Future<dynamic> deleteOrder(String id) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.delete(
      appNetwork.getOrderUrl + id,
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == HttpStatus.ok) {
      utils.showSnackBar(LocaleKeys.succes_removeSuccessful);
    }
  }

  @override
  Future<dynamic> patchOrder(String id, String key, String value) async {
    final cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.patch(
      appNetwork.getOrderUrl + id,
      data: [
        {'propName': key, 'value': value},
      ],
      options: Options(
        headers: {
          'content-type': 'application/json',
          'authorization': cookie,
        },
      ),
    );
    if (response.statusCode == HttpStatus.ok) {}
  }
}
