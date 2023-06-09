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
  final Customer? customer;

  @override
  List<Object?> get props => [customer];
}
