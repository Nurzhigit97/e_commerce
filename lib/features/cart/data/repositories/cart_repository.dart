import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/cart/data/datasources/remote_cart_datasource.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<List<CartModel>, String>> getCarts() {
    return remoteDataSource.getCarts();
  }

  @override
  Future<Either<void, String>> addToCart(ProductModel product) {
    return remoteDataSource.addToCart(product);
  }

  @override
  Future<Either<void, String>> removeFromCart(ProductModel product) {
    return remoteDataSource.removeFromCart(product);
  }

  @override
  Future<Either<void, String>> deleteCart() {
    return remoteDataSource.deleteCart();
  }
}
