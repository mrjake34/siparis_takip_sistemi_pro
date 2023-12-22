import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/update_model.dart';

import '../../../../product/core/base/models/base_bloc.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../model/product.dart';
import '../model/product_list.dart';
import '../service/product_service.dart';

part 'products_event.dart';
part 'products_state.dart';

final class ProductsBloc extends BaseBloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    final productService = ProductService();
    on<ProductListEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await productService.getProducts<ProductList>(
        cookie: event.cookie,
      );
      if (response.data != null) {
        emit(
          state.copyWith(
            status: Status.isDone,
            productList: response.data?.products,
          ),
        );
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
    on<AddProductEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      final response = await productService.addProduct<ProductList>(
        product: event.product,
        cookie: event.cookie,
      );
      if (response.statusCode == HttpStatus.ok) {
        emit(state.copyWith(status: Status.isDone));
      } else {
        emit(state.copyWith(status: Status.isFailed));
      }
    });
    on<EditProductEvent>((event, emit) async {
      emit(state.copyWith(status: Status.isLoading));
      if (event.data == null || event.id == null) {
        emit(state.copyWith(status: Status.isFailed));
      } else {
        final response = await productService.updateProduct<Product>(
          model: Product(),
          data: UpdateModel(
            propName: event.data?.propName,
            value: event.data?.value,
          ),
          id: event.id,
        );
        if (response.statusCode == HttpStatus.ok) {
          emit(state.copyWith(status: Status.isDone));
        } else {
          emit(state.copyWith(status: Status.isFailed));
        }
      }
    });
    on<EditProductNameEditButtonEvent>((event, emit) async {
      safeEmit(state.copyWith(isEditing: !(state.isEditing ?? false)));
    });
  }
}
