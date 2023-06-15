// ignore_for_file: prefer_final_locals, cascade_invocations

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/core/init/utils/utils.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/model/customer.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/model/order.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/orders/service/order_service.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/product/model/product.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  // ignore: public_member_api_docs
  OrdersBloc() : super(const OrdersState()) {
    on<OrdersListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await OrderService().getOrderList();
      // print(response.data?.order);
      emit(state.copyWith(status: Status.isDone, orderList: response));
    });
    on<PendingOrdersEvent>((event, emit) {
      final response = state.orderList?.products
          .where((element) => element.orderStatus == 'waiting')
          .toList();

      emit(state.copyWith(pendingOrders: response));
    });
    on<ProcessOrdersEvent>((event, emit) async {
      final response = state.orderList?.products
          .where((element) => element.orderStatus == 'inProcess')
          .toList();
      emit(state.copyWith(processOrders: response));
    });
    on<OnTheWayOrdersEvent>((event, emit) {
      final response = state.orderList?.products
          .where((element) => element.orderStatus == 'inDistribution')
          .toList();

      emit(state.copyWith(onTheWayOrders: response));
    });
    on<DoneOrdersEvent>((event, emit) {
      final response = state.orderList?.products
          .where((element) => element.orderStatus == 'completed')
          .toList();
      emit(state.copyWith(doneOrders: response));
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
            price += product.totalPrice ?? 0;
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
              price += product.totalPrice ?? 0;
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
        newList[event.index!].quantity = event.count!;
        emit(state.copyWith(productList: newList));
        double price;
        price = 0;
        if (state.productList != null) {
          for (final product in state.productList!) {
            price += product.totalPrice ?? 0;
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
        newList[event.index!].productNote = event.note;
        emit(state.copyWith(productList: newList));
      }
    });
    on<AddOrderClearProductList>((event, emit) {
      List<Product>? newList = List.from(state.productList ?? []);
      newList.clear();
      emit(state.copyWith(productList: newList, customer: const Customer()));
      double price;
      price = 0;
      if (state.productList != null) {
        for (final product in state.productList!) {
          price += product.totalPrice ?? 0;
        }
        emit(state.copyWith(orderCartTotalPrice: price));
      }
    });
    on<AddOrderPostOrderEvent>((event, emit) {
      final orderListPostOut = <Map<String, dynamic>>[];
      if (state.customer != null && state.productList != null) {
        try {
          for (final Product? product in state.productList!) {
            orderListPostOut.add({
              'productId': product?.id,
              'quantity': product?.quantity,
              'productNote': product?.productNote
            });
          }
        } finally {
          OrderService().postOrder(
            state.customer?.id ?? '',
            event.orderNote ?? '',
            orderListPostOut,
          );
        }
      } else {
        UtilsService.instance
            .errorSnackBar(LocaleKeys.errors_pleaseEnterAllField.tr());
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
}
