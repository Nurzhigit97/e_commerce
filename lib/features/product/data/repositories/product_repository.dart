import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/product/data/datasources/remote_product_datasource.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';

class ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepository(this.remoteDataSource);

  Future<Either<List<ProductModel>, String>> getProducts() async {
    return remoteDataSource.getProducts();
  }
}
