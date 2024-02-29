part of 'product_bloc.dart';

enum ProductStateStatus { initial, loading, success, failure }

final class ProductState extends Equatable {
  const ProductState(
      {this.status = ProductStateStatus.initial, this.products = const []});

  final ProductStateStatus status;
  final List<ProductModel> products;

  @override
  List<Object> get props => [status, products];

  ProductState copyWith(
          {ProductStateStatus? status, List<ProductModel>? products}) =>
      ProductState(
          status: status ?? this.status, products: products ?? this.products);
}
