import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';

abstract class CartRemoteDataSource {
  Future<Either<List<CartModel>, String>> getCarts();
  Future<Either<void, String>> addToCart(ProductModel product);
  Future<Either<void, String>> removeFromCart(ProductModel product);
  Future<Either<void, String>> deleteCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio _dio;

  CartRemoteDataSourceImpl(this._dio);

  @override
  Future<Either<List<CartModel>, String>> getCarts() async {
    try {
      final response = await _dio.get('/carts');
      final carts =
          (response.data as List)
              .map((cart) => CartModel.fromJson(cart))
              .toList();
      return Left(carts);
    } on DioException catch (e) {
      return Right(e.message ?? 'Unknown error');
    }
  }

  @override
  Future<Either<void, String>> addToCart(ProductModel product) async {
    try {
      await _dio.post('/cart', data: product.toJson());

      return Left(null);
    } on DioException catch (e) {
      return Right(e.message ?? 'Unknown error');
    }
  }

  @override
  Future<Either<void, String>> removeFromCart(ProductModel product) async {
    try {
      await _dio.delete('/cart/${product.id}');
      return Left(null);
    } on DioException catch (e) {
      return Right(e.message ?? 'Unknown error');
    }
  }

  @override
  Future<Either<void, String>> deleteCart() async {
    try {
      await _dio.delete('/cart');
      return Left(null);
    } on DioException catch (e) {
      return Right(e.message ?? 'Unknown error');
    }
  }
}
