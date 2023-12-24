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
  final List<OrderModel>? orderList;
  final double? orderCartTotalPrice;
  final List<Product>? productList;
  final OrderModel? order;
  final Customer? customer;
  final Status? status;
  final List<OrderModel>? pendingOrders;
  final List<OrderModel>? processOrders;
  final List<OrderModel>? onTheWayOrders;
  final List<OrderModel>? doneOrders;

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
        orderCartTotalPrice,
      ];

  OrdersState copyWith({
    List<OrderModel>? orderList,
    double? orderCartTotalPrice,
    OrderModel? order,
    Customer? customer,
    Status? status,
    List<OrderModel>? pendingOrders,
    List<OrderModel>? processOrders,
    List<OrderModel>? onTheWayOrders,
    List<OrderModel>? doneOrders,
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
