import 'package:shopping_app/models/product_model.dart';

/// ProductItem:
/// product: ProductModel,
/// quantity: int

class ProductItem {
  final ProductModel product;
  final int quantity;

  ProductItem({
    required this.product,
    required this.quantity,
  });

  ProductItem copyWithIncreaseQuantity(
          {ProductModel? product, int? quantity}) =>
      ProductItem(
          product: product ?? this.product,
          quantity: quantity ?? this.quantity + 1);

  ProductItem copyWithDecreaseQuantity(
          {ProductModel? product, int? quantity}) =>
      ProductItem(
          product: product ?? this.product,
          quantity: quantity ?? (this.quantity <= 0 ? 0 : this.quantity - 1));

  ProductItem copyWith({
    ProductModel? product,
    int? quantity,
  }) =>
      ProductItem(
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
      );

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        product: json["product"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
      };
}
