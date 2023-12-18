part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class ProductListEvent extends ProductsEvent {
  const ProductListEvent({this.productList});
  final ProductList? productList;

  @override
  List<Object?> get props => [productList];
}

class AddProductEvent extends ProductsEvent {

  const AddProductEvent({this.productName, this.productPrice});
  final String? productName;
  final double? productPrice;

  @override
  List<Object?> get props => [productName, productPrice];
}

class EditProductEvent extends ProductsEvent {

  const EditProductEvent({this.key, this.value, this.id});
  final PatchProductEnums? key;
  final String? value;
  final String? id;

  @override
  List<Object?> get props => [key, value, id];
}
