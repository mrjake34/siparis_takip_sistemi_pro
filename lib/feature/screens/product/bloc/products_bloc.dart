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
  ProductsBloc({required this.productService}) : super(const ProductsState()) {
    on<ProductListEvent>((event, emit) async {
      await _fetchProductList(event);
    });
    on<AddProductEvent>((event, emit) async {
      await _addProductList(event);
    });
    on<EditProductEvent>((event, emit) async {
      await _editProductList(event);
    });
    on<EditProductNameEditButtonEvent>((event, emit) async {
      safeEmit(state.copyWith(isEditing: !(state.isEditing ?? false)));
    });
  }
  late final ProductService productService;

  Future<void> _editProductList(EditProductEvent event) async {
    safeEmit(state.copyWith(status: Status.isLoading));
    if (event.data == null || event.id == null) {
      safeEmit(state.copyWith(status: Status.isFailed));
    } else {
      final response = await productService.updateProduct<Product, Product>(
        model: Product(),
        data: UpdateModel(
          propName: event.data?.propName,
          value: event.data?.value,
        ),
        id: event.id,
      );
      if (response.statusCode == HttpStatus.ok) {
        safeEmit(state.copyWith(status: Status.isDone));
      } else {
        safeEmit(state.copyWith(status: Status.isFailed));
      }
    }
  }

  Future<void> _addProductList(AddProductEvent event) async {
    safeEmit(state.copyWith(status: Status.isLoading));
    final response = await productService.addProduct<ProductList, ProductList>(
      product: event.product,
      cookie: event.cookie,
    );
    if (response.statusCode == HttpStatus.ok) {
      safeEmit(state.copyWith(status: Status.isDone));
    } else {
      safeEmit(state.copyWith(status: Status.isFailed));
    }
  }

  Future<void> _fetchProductList(ProductListEvent event) async {
    safeEmit(state.copyWith(status: Status.isLoading));
    final response = await productService.getProducts<ProductList, ProductList>(
      cookie: event.cookie,
    );
    if (response.data != null) {
      safeEmit(
        state.copyWith(
          status: Status.isDone,
          productList: response.data?.products,
        ),
      );
    } else {
      safeEmit(state.copyWith(status: Status.isFailed));
    }
  }
}
