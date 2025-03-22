import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<Either<List<ProductModel>, String>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSourceImpl(this._dio);

  @override
  Future<Either<List<ProductModel>, String>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      final products =
          (response.data as List)
              .map((product) => ProductModel.fromJson(product))
              .toList();
      return Left(products);
    } on DioException catch (e) {
      return Right(e.message ?? 'Unknown error');
    }
  }
}
