import '../model/order.dart';

abstract class IOrderService {
  IOrderService();

  Future postOrder(String customerId, String orderNote, List orderListPostOut);
  Future<OrderList?> getOrderList();
  Future<Order> getOrder(String id);
  Future deleteOrder(String id);
  Future patchOrder(String id, String key, String value);
}
