import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(CartState(
            userId: 1,
            date: DateTime.now(),
            products: const [],
            total: 0,
            status: CartStatus.initial));

  int getItemQuantityFromCart() =>
      state.status == CartStatus.success ? state.products.length : 0;

  double get getTotal {
    final list = [...state.products];
    double total = 0;
    for (ProductItem item in list) {
      total += item.quantity * item.product.price;
    }
    return total;
  }

  void deleteProductItem({required ProductItem productItem}) {
    final list = [
      ...state.products.where((element) => element != productItem)
    ]; // delete product item & return a list
    emit(state.copyWith(products: list));
    emit(state.copyWith(total: getTotal));
  }

  void checkOut() {
    emit(state.copyWith(products: [], total: 0.0));
  }

  void increaseQuantity({required int productIndex}) {
    final list = [...state.products]; // get current list
    list[productIndex] = list[productIndex]
        .copyWithIncreaseQuantity(); // increase quantity at index item
    emit(state.copyWith(products: list));
    emit(state.copyWith(total: getTotal));
  }

  void decreaseQuantity({required int productIndex}) {
    final list = [...state.products]; // get current list
    if (list[productIndex].quantity <= 1) {
      list.removeAt(productIndex);
    } else {
      list[productIndex] = list[productIndex].copyWithDecreaseQuantity();
    }
    emit(state.copyWith(products: list));
    emit(state.copyWith(total: getTotal));
  }

  void addItemToCart(ProductModel productModel, int quantity) {
    ProductItem productItem = ProductItem(
        product: productModel, quantity: quantity); // create new product item
    List<ProductItem> list = [
      ...state.products
    ]; // get current list product item in cart
    final int index = list.indexWhere((element) =>
        element.product ==
        productItem.product); // check index of product item in cart

    if (index == -1) {
      list = [
        productItem,
        ...state.products
      ]; // if new product item has not exist => add new
    } else {
      int newQuantity =
          list[index].quantity + productItem.quantity; // increase quantity
      list[index] = list[index].copyWith(quantity: newQuantity);
    }

    emit(state.copyWith(products: list)); // emit change
    emit(state.copyWith(total: getTotal));
  }
}
