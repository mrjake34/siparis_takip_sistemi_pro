import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/constants/enums/network_enums.dart';
import '../model/product.dart';
import '../service/product_service.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<ProductListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await ProductService().fetchProductList();
      if (response != null) {
        emit(state.copyWith(status: Status.isDone, productList: response));
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
    on<AddProductEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await ProductService()
          .addProduct(event.productName ?? "", event.productPrice ?? 0.0);
      if (response?.statusCode == HttpStatus.ok) {
        emit(state.copyWith(status: Status.isDone));
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
    on<EditProductEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      if (event.key != null && event.value != null && event.id != null) {
        final response = await ProductService()
            .patchProduct(key: event.key, value: event.value, id: event.id);
        if (response?.statusCode == HttpStatus.ok) {
          emit(state.copyWith(status: Status.isDone));
        } else {
          emit(state.copyWith(status: Status.isFailed));
        }
      }
    });
  }
}
