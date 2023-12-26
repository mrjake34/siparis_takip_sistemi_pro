import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/customer.dart';
import '../service/customer_service.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(const CustomerState()) {
    on<FetchCustomerListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await CustomerService().getCustomersList<CustomerList>();
      emit(state.copyWith(status: Status.isDone, customerList: response.data));
    });
    on<AddCustomerEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      if (event.customer != null) {
        final response = await CustomerService().addCustomer<CustomerList>(
          customer: event.customer,
        );
        if (response.statusCode == HttpStatus.ok) {
          emit(state.copyWith(status: Status.isDone));
        } else {
          emit(state.copyWith(status: Status.isFailed));
        }
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
  }
}
