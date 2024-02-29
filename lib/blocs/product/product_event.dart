part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class GetAllProductEvent extends ProductEvent {}

final class GetProductByIdEvent extends ProductEvent {
  const GetProductByIdEvent(this.id);
  final String id;

  @override
  List<Object> get props => [id];
}

final class ClearProduct extends ProductEvent {}
