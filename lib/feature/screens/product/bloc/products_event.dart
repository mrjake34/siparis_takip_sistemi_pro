part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class ProductListEvent extends ProductsEvent {
  const ProductListEvent({this.cookie});

  final String? cookie;

  @override
  List<Object?> get props => [cookie];
}

final class AddProductEvent extends ProductsEvent {
  const AddProductEvent({this.product, this.cookie});
  final Product? product;
  final String? cookie;

  @override
  List<Object?> get props => [product, cookie];
}

final class EditProductEvent extends ProductsEvent {
  const EditProductEvent({this.model, this.id, this.cookie});
  final UpdateModel<ProductEnum>? model;
  final String? id;
  final String? cookie;

  @override
  List<Object?> get props => [model, id, cookie];
}

final class EditProductNameEditButtonEvent extends ProductsEvent {}
