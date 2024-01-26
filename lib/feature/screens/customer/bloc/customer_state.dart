part of 'customer_bloc.dart';

class CustomerState extends Equatable {
  const CustomerState({this.customer, this.customerList, this.status});
  final CustomerModel? customer;
  final CustomerResponse? customerList;
  final Enum? status;

  @override
  List<Object?> get props => [customer, customerList, status];

  CustomerState copyWith({
    CustomerModel? customer,
    CustomerResponse? customerList,
    Enum? status,
  }) {
    return CustomerState(
      customer: customer ?? this.customer,
      customerList: customerList ?? this.customerList,
      status: status ?? this.status,
    );
  }
}
