import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<List<CartEntity>, String>> getCarts();
  Future<Either<void, String>> addToCart(ProductModel product);
  Future<Either<void, String>> removeFromCart(ProductModel product);
  Future<Either<void, String>> deleteCart();
}
