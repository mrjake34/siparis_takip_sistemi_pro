import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:vexana/vexana.dart';
import '../../../../core/base/models/base_model_view.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../model/order.dart';
import 'order_service_interface.dart';

class OrderService extends IOrderService with BaseModelView {
  OrderService();
  @override
  Future postOrder(
      String customerId, String orderNote, List orderListPostOut) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    String body = jsonEncode({
      "customerId": customerId,
      "orderNote": orderNote,
      "products": orderListPostOut
    });
    final response = await networkService.dio.post(
      appNetwork.postOrderUrl,
      options: Options(
        headers: {
          "content-type": "application/json",
          "authorization": cookie,
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
    final response = await networkService.dio.get(appNetwork.postOrderUrl,
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": cookie,
          },
        ));
    if (response.statusCode == HttpStatus.ok) {
      OrderList orderList = OrderList.fromJson(response.data);
      return orderList;
    } else if (response.statusCode == HttpStatus.badRequest) {
      return null;
    } else {
      return null;
    }
  }

  @override
  Future<Order> getOrder(String id) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);

    final response = await networkService.dio.get(appNetwork.getOrderUrl + id,
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": cookie,
          },
        ));
    Order order = Order.fromJson(response.data);
    return order;
  }

  @override
  Future deleteOrder(String id) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.delete(appNetwork.getOrderUrl + id,
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": cookie,
          },
        ));
    if (response.statusCode == 200) {
      utils.showSnackBar(LocaleKeys.succes_removeSuccessful);
    }
  }

  @override
  Future patchOrder(String id, String key, String value) async {
    String? cookie = sharedManager.getStringValue(PreferenceKey.cookie);
    final response = await networkService.dio.patch(appNetwork.getOrderUrl + id,
        data: [
          {"propName": key, "value": value}
        ],
        options: Options(
          headers: {
            "content-type": "application/json",
            "authorization": cookie,
          },
        ));
    if (response.statusCode == 200) {}
  }
}
