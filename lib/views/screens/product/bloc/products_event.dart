part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class ProductListEvent extends ProductsEvent {
  final ProductList? productList;

  const ProductListEvent({this.productList});

  @override
  List<Object?> get props => [productList];
}

class AddProductEvent extends ProductsEvent {
  final String? productName;
  final double? productPrice;

  const AddProductEvent({this.productName, this.productPrice});

  @override
  List<Object?> get props => [productName, productPrice];
}

class EditProductEvent extends ProductsEvent {
  final PatchProductEnums? key;
  final String? value;
  final String? id;

  const EditProductEvent({this.key, this.value, this.id});

  @override
  List<Object?> get props => [key, value, id];
}
