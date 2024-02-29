// import 'package:dio/dio.dart';

abstract class DataRepository {
  Future<Map<String, dynamic>> getAllProduct();
  Future<Map<String, dynamic>> getProductById(String id);
  Future<Map<String, dynamic>> getUserCart(String idUser);
}
