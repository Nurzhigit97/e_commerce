import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/product/data/repositories/product_repository.dart';
import 'package:e_commerce/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce/shared/core/usecase/usecase.dart';

class GetProductsUseCase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository _repository;

  GetProductsUseCase(this._repository);

  @override
  Future<Either<List<ProductEntity>, String>> call(NoParams params) async {
    return await _repository.getProducts();
  }
}
