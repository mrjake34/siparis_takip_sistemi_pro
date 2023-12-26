part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class OrdersListEvent extends OrdersEvent {
  @override
  List<Object?> get props => [];
}

class PendingOrdersEvent extends OrdersEvent {
  @override
  List<Object?> get props => [];
}

class ProcessOrdersEvent extends OrdersEvent {
  @override
  List<Object?> get props => [];
}

class OnTheWayOrdersEvent extends OrdersEvent {
  @override
  List<Object?> get props => [];
}

class DoneOrdersEvent extends OrdersEvent {
  @override
  List<Object?> get props => [];
}

class OrderCartProductsEvent extends OrdersEvent {
  const OrderCartProductsEvent({this.product});
  final Product? product;

  @override
  List<Object?> get props => [product];
}

class OrderCartRemoveProductEvent extends OrdersEvent {
  const OrderCartRemoveProductEvent({this.index});
  final int? index;

  @override
  List<Object?> get props => [index];
}

class OrderCartChangeProductCountEvent extends OrdersEvent {
  const OrderCartChangeProductCountEvent({this.count, this.index});
  final int? index;
  final int? count;

  @override
  List<Object?> get props => [index, count];
}

class OrderCartChangeProductNoteEvent extends OrdersEvent {
  const OrderCartChangeProductNoteEvent({this.note, this.index});
  final int? index;
  final String? note;

  @override
  List<Object?> get props => [index, note];
}

class AddOrderPostOrderEvent extends OrdersEvent {
  const AddOrderPostOrderEvent({
    this.customer,
    this.orderNote,
  });

  final String? orderNote;
  final Customer? customer;

  @override
  List<Object?> get props => [orderNote, customer];
}

class AddOrderClearProductList extends OrdersEvent {
  const AddOrderClearProductList();

  @override
  List<Object?> get props => [];
}

class CalculateOrderCartPrice extends OrdersEvent {
  const CalculateOrderCartPrice();

  @override
  List<Object?> get props => [];
}

class AddOrderAddCustomerEvent extends OrdersEvent {
  const AddOrderAddCustomerEvent({this.customer});

  final Customer? customer;
  @override
  List<Object?> get props => [customer];
}

class ChooseAnOrder extends OrdersEvent {
  const ChooseAnOrder({this.order});

  final OrderModel? order;
  @override
  List<Object?> get props => [order];
}
