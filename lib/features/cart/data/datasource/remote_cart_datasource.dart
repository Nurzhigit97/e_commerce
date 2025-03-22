import 'package:dio/dio.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';

class CartRemoteDataSource {
  final Dio _dio;

  CartRemoteDataSource(this._dio);

  Future<List<CartModel>> getCarts() async {
    try {
      final response = await _dio.get('/carts');
      final carts =
          (response.data as List)
              .map((cart) => CartModel.fromJson(cart))
              .toList();
      return carts;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> addToCart(CartModel product) async {
    try {
      await _dio.post('/cart', data: product.toJson());
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> removeFromCart(CartModel product) async {
    try {
      await _dio.delete('/cart/${product.id}');
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteCart() async {
    try {
      await _dio.delete('/cart');
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
