import 'package:dio/dio.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/services/product_repo.dart';

class ProductRepository implements DataRepository {
  Dio dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/"));

  @override
  Future<Map<String, dynamic>> addNewProductToCart(CartModel cartModel) async {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getAllProduct() async {
    Response response = await dio.get("/products");
    return {
      "statusCode": response.statusCode,
      "statusMessage": response.statusMessage,
      "data": response.data
    };
  }

  @override
  Future<Map<String, dynamic>> getProductById(String id) async {
    Response response = await dio.get("/products/$id");
    return {
      "statusCode": response.statusCode,
      "statusMessage": response.statusMessage,
      "data": response.data
    };
  }

  @override
  Future<Map<String, dynamic>> getUserCart(String idUser) {
    throw UnimplementedError();
  }
}
