class ProductItem {
  final int productId;
  final int quantity;

  ProductItem({
    required this.productId,
    required this.quantity,
  });

  ProductItem copyWithIncreaseQuantity({int? productId, int? quantity}) =>
      ProductItem(
          productId: productId ?? this.productId,
          quantity: quantity ?? this.quantity + 1);

  ProductItem copyWithDecreaseQuantity({int? productId, int? quantity}) =>
      ProductItem(
          productId: productId ?? this.productId,
          quantity: quantity ?? this.quantity - 1);

  ProductItem copyWith({
    int? productId,
    int? quantity,
  }) =>
      ProductItem(
        productId: productId ?? this.productId,
        quantity: quantity ?? this.quantity,
      );

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
