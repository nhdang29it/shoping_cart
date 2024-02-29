part of 'cart_cubit.dart';

enum CartStatus { loading, success, failure, initial }

final class CartState extends Equatable {
  const CartState(
      {required this.userId,
      required this.date,
      required this.products,
      required this.status});

  final int userId;
  final DateTime date;
  final List<ProductItem> products;
  final CartStatus status;

  CartState copyWith(
          {int? userId,
          DateTime? date,
          List<ProductItem>? products,
          CartStatus? status}) =>
      CartState(
          userId: userId ?? this.userId,
          date: date ?? this.date,
          products: products ?? this.products,
          status: status ?? this.status);

  @override
  List<Object> get props => [userId, date, products];
}
