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
  final Product? product;

  const OrderCartProductsEvent({this.product});

  @override
  List<Object?> get props => [product];
}

class OrderCartRemoveProductEvent extends OrdersEvent {
  final int? index;

  const OrderCartRemoveProductEvent({this.index});

  @override
  List<Object?> get props => [index];
}

class OrderCartChangeProductCountEvent extends OrdersEvent {
  final int? index;
  final int? count;

  const OrderCartChangeProductCountEvent({this.count, this.index});

  @override
  List<Object?> get props => [index, count];
}

class OrderCartChangeProductNoteEvent extends OrdersEvent {
  final int? index;
  final String? note;

  const OrderCartChangeProductNoteEvent({this.note, this.index});

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

  final Order? order;
  @override
  List<Object?> get props => [order];
}
