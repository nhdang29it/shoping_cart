part of 'cart_cubit.dart';

///type: loading, success, failure, initial
enum CartStatus { loading, success, failure, initial }

final class CartState extends Equatable {
  const CartState(
      {required this.userId,
      required this.date,
      required this.products,
      this.total = 0,
      required this.status});

  final int userId;
  final DateTime date;
  final List<ProductItem> products;
  final double total;
  final CartStatus status;

  CartState copyWith(
          {int? userId,
          DateTime? date,
          List<ProductItem>? products,
          double? total,
          CartStatus? status}) =>
      CartState(
          userId: userId ?? this.userId,
          date: date ?? this.date,
          products: products ?? this.products,
          total: total ?? this.total,
          status: status ?? this.status);

  @override
  List<Object> get props => [userId, date, products, total];
}
