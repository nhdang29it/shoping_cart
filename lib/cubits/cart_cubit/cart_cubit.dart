import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/blocs/product/product_bloc.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(CartState(
            userId: 1,
            date: DateTime.now(),
            products: const [],
            status: CartStatus.initial));

  int getItemQuantityFromCart() =>
      state.status == CartStatus.success ? state.products.length : 0;

  double getTotal(ProductBloc productBloc) {
    final list = state.products;
    double total = 0;
    for (ProductItem item in list) {
      total += item.quantity * productBloc.getProductById(item.productId).price;
    }
    return total;
  }

  void increaseQuantity(int index) {
    final list = state.products; // get current list
    list[index] = list[index]
        .copyWithIncreaseQuantity(); // increase quantity at index item
    emit(state.copyWith(products: list));
  }

  void decreaseQuantity(int index) {
    final list = state.products; // get current list

    if (list[index].quantity <= 1) {
      list.removeAt(index);
      emit(state.copyWith(products: list));
    } else {
      list[index] = list[index].copyWithDecreaseQuantity();
      emit(state.copyWith(products: list));
    }
  }

  void addItemToCart(ProductModel productModel, int quantity) {
    ProductItem productItem = ProductItem(
        productId: productModel.id,
        quantity: quantity); // create new product item
    List<ProductItem> list =
        state.products; // get current list product item in cart
    final int index = list // check index of product item in cart
        .indexWhere((element) => element.productId == productItem.productId);

    if (index == -1) {
      list = [
        productItem,
        ...state.products
      ]; // if new product item has not exist => add new
    } else {
      int newQuantity = list[index].quantity + quantity; // increase quantity
      list[index] = list[index].copyWith(quantity: newQuantity);
    }

    emit(state.copyWith(products: list)); // emit change
  }
}
