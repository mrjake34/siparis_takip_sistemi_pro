// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  const OrdersState({
    this.orderCartTotalPrice,
    this.productList,
    this.customer,
    this.processOrders,
    this.onTheWayOrders,
    this.doneOrders,
    this.pendingOrders,
    this.status,
    this.orderList,
    this.order,
  });
  final OrderList? orderList;
  final double? orderCartTotalPrice;
  final List<Product>? productList;
  final OrderListProduct? order;
  final Customer? customer;
  final Status? status;
  final List<OrderListProduct>? pendingOrders;
  final List<OrderListProduct>? processOrders;
  final List<OrderListProduct>? onTheWayOrders;
  final List<OrderListProduct>? doneOrders;

  @override
  List<Object?> get props => [
        status,
        orderList,
        order,
        pendingOrders,
        processOrders,
        onTheWayOrders,
        doneOrders,
        customer,
        productList,
        orderCartTotalPrice
      ];

  OrdersState copyWith({
    OrderList? orderList,
    double? orderCartTotalPrice,
    OrderListProduct? order,
    Customer? customer,
    Status? status,
    List<OrderListProduct>? pendingOrders,
    List<OrderListProduct>? processOrders,
    List<OrderListProduct>? onTheWayOrders,
    List<OrderListProduct>? doneOrders,
    List<Product>? productList,
  }) {
    return OrdersState(
      orderList: orderList ?? this.orderList,
      orderCartTotalPrice: orderCartTotalPrice ?? this.orderCartTotalPrice,
      order: order ?? this.order,
      customer: customer ?? this.customer,
      status: status ?? this.status,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      processOrders: processOrders ?? this.processOrders,
      onTheWayOrders: onTheWayOrders ?? this.onTheWayOrders,
      doneOrders: doneOrders ?? this.doneOrders,
      productList: productList ?? this.productList,
    );
  }
}
