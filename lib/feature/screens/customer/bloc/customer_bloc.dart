import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_respose_model.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/network_status.dart';

import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../model/customer.dart';
import '../service/customer_service.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(const CustomerState()) {
    on<FetchCustomerListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await CustomerService().getCustomersList();
      emit(state.copyWith(status: Status.isDone, customerList: response));
    });
    on<AddCustomerEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      if (event.customer != null) {
        final response = await CustomerService()
            .addCustomer<BaseResponseModel<NetworkStatus>>(
          customer: event.customer,
        );
        if (response.statusCode == HttpStatus.ok) {
          emit(state.copyWith(status: Status.isDone));
          UtilsService.instance
              .showSnackBar(LocaleKeys.succes_productAdded.tr());
        } else {
          emit(state.copyWith(status: Status.isFailed));
        }
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
  }
}
