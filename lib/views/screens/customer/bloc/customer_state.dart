// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'customer_bloc.dart';

class CustomerState extends Equatable {
  const CustomerState({this.customer, this.customerList, this.status});
  final Customer? customer;
  final CustomerList? customerList;
  final Enum? status;

  @override
  List<Object?> get props => [customer, customerList, status];

  CustomerState copyWith({
    Customer? customer,
    CustomerList? customerList,
    Enum? status,
  }) {
    return CustomerState(
      customer: customer ?? this.customer,
      customerList: customerList ?? this.customerList,
      status: status ?? this.status,
    );
  }
}
