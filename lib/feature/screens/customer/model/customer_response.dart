import 'package:json_annotation/json_annotation.dart';

import '../../../../product/core/base/interface/base_network_model.dart';
import 'customer_model.dart';

part 'customer_response.g.dart';

@JsonSerializable()
final class CustomerResponse extends IBaseNetworkModel<CustomerResponse> {
  CustomerResponse({
    this.message,
    this.customers,
  });

  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
  final String? message;
  final List<CustomerModel>? customers;

  CustomerResponse copyWith({
    String? message,
    List<CustomerModel>? customers,
  }) =>
      CustomerResponse(
        message: message ?? this.message,
        customers: customers ?? this.customers,
      );

  @override
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);

  @override
  CustomerResponse fromJson(Map<String, dynamic> json) {
    return CustomerResponse.fromJson(json);
  }

  @override
  List<Object?> get props => [message, customers];
}
