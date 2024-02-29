import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/services/dio_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(const ProductState()) {
    on<GetAllProductEvent>(_getAllProductEvent);
  }

  final ProductRepository _productRepository;

  FutureOr<void> _getAllProductEvent(
      GetAllProductEvent event, Emitter<ProductState> emit) async {
    emit.call(state.copyWith(status: ProductStateStatus.loading));

    await _productRepository.getAllProduct().then((result) {
      final List<dynamic> data = result["data"];
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      emit.call(state.copyWith(
          status: ProductStateStatus.success, products: products));
    }).onError((error, stackTrace) {
      emit.call(state.copyWith(status: ProductStateStatus.failure));
    });
  }
}
