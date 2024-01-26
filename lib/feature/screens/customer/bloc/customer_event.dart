part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();

  @override
  List<Object?> get props => [];
}

class FetchCustomerListEvent extends CustomerEvent {
  @override
  List<Object?> get props => [];
}

class AddCustomerEvent extends CustomerEvent {
  const AddCustomerEvent({this.customer});
  final CustomerModel? customer;

  @override
  List<Object?> get props => [customer];
}

class CustomerDeleteEvent extends CustomerEvent {
  const CustomerDeleteEvent({this.id, this.cookie});
  final String? id;
  final String? cookie;

  @override
  List<Object?> get props => [id, cookie];
}
