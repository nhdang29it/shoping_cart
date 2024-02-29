// import 'package:dio/dio.dart';

import 'package:shopping_app/models/cart_model.dart';

abstract class DataRepository {
  Future<Map<String, dynamic>> getAllProduct();
  Future<Map<String, dynamic>> getProductById(String id);
  Future<Map<String, dynamic>> getUserCart(String idUser);
  Future<Map<String, dynamic>> addNewProductToCart(CartModel cartModel);
}
