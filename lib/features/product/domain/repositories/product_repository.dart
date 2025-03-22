import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<List<ProductEntity>, String>> getProducts();
}
