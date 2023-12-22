// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

class ProductsState extends Equatable {
  const ProductsState({
    this.productList,
    this.product,
    this.status,
    this.isEditing,
  });
  final List<Product>? productList;
  final Product? product;
  final Status? status;
  final bool? isEditing;

  @override
  List<Object?> get props => [productList, product, status, isEditing];

  ProductsState copyWith({
    List<Product>? productList,
    Product? product,
    Status? status,
    bool? isEditing,
  }) {
    return ProductsState(
      productList: productList ?? this.productList,
      product: product ?? this.product,
      status: status ?? this.status,
      isEditing: isEditing ?? this.isEditing,
    );
  }
}
