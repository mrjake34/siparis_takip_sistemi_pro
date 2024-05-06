// ignore_for_file: prefer_final_locals, cascade_invocations

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/customer/model/customer_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_response_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/service/order_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/product/model/product.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  // ignore: public_member_api_docs
  OrdersBloc(OrderService orderService)
      : _orderService = orderService,
        super(const OrdersState()) {
    on<OrdersListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await _orderService.getOrderList<OrderResponseModel>();

      emit(
        state.copyWith(
          status: Status.isDone,
          orderList: response.data?.products,
        ),
      );
    });
    on<OrderCartProductsEvent>((event, emit) {
      if (event.product != null) {
        List<Product>? newList;
        newList = List.from(state.productList ?? [])..add(event.product!);
        emit(state.copyWith(productList: newList));
        double price;
        price = 0;
        if (state.productList != null) {
          for (final product in state.productList!) {
            price += product.price ?? 0;
          }
          emit(state.copyWith(orderCartTotalPrice: price));
        }
      }
    });
    on<OrderCartRemoveProductEvent>((event, emit) {
      if (event.index != null && state.productList != null) {
        final newList = List<Product>.from(state.productList!);
        if (event.index! >= 0 && event.index! < newList.length) {
          newList.removeAt(event.index!);
          emit(state.copyWith(productList: newList));
          double price;
          price = 0;
          if (state.productList != null) {
            for (final product in state.productList!) {
              price += product.price ?? 0;
            }
            emit(state.copyWith(orderCartTotalPrice: price));
          }
        }
      }
    });
    on<OrderCartChangeProductCountEvent>((event, emit) {
      if (event.index != null &&
          event.count != null &&
          state.productList != null) {
        final newList = List<Product>.from(state.productList!);

        emit(state.copyWith(productList: newList));
        double price;
        price = 0;
        if (state.productList != null) {
          for (final product in state.productList!) {
            price += product.price ?? 0;
          }
          emit(state.copyWith(orderCartTotalPrice: price));
        }
      }
    });
    on<OrderCartChangeProductNoteEvent>((event, emit) {
      if (event.index != null &&
          event.note != null &&
          state.productList != null) {
        final newList = List<Product>.from(state.productList!);

        emit(state.copyWith(productList: newList));
      }
    });
    on<AddOrderClearProductList>((event, emit) {
      List<Product>? newList = List.from(state.productList ?? []);
      newList.clear();
      emit(state.copyWith(productList: newList, customer: CustomerModel()));
      double price;
      price = 0;
      if (state.productList != null) {
        for (final product in state.productList!) {
          price += product.price ?? 0;
        }
        emit(state.copyWith(orderCartTotalPrice: price));
      }
    });

    on<AddOrderAddCustomerEvent>((event, emit) {
      if (event.customer != null) {
        emit(state.copyWith(customer: event.customer));
      }
    });
    on<ChooseAnOrder>((event, emit) {
      if (event.order != null) {
        emit(state.copyWith(order: event.order));
      }
    });
  }
  late final OrderService _orderService;
}
