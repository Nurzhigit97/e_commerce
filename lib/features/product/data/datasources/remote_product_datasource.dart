import 'package:dio/dio.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';

class ProductRemoteDataSource {
  final Dio _dio;

  ProductRemoteDataSource(this._dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get('/products');
      final products =
          (response.data as List)
              .map((product) => ProductModel.fromJson(product))
              .toList();
      return products;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
