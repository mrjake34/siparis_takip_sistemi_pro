import '../model/order.dart';

abstract class IOrderService {
  IOrderService();

  Future<dynamic> postOrder(String customerId, String orderNote, List<dynamic> orderListPostOut);
  Future<OrderList?> getOrderList();
  Future<Order> getOrder(String id);
  Future<dynamic> deleteOrder(String id);
  Future<dynamic> patchOrder(String id, String key, String value);
}
