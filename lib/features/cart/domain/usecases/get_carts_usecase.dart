import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_commerce/shared/core/usecase/usecase.dart';

class GetCartsUseCase extends UseCase<List<CartEntity>, NoParams> {
  final CartRepository _repository;

  GetCartsUseCase(this._repository);

  @override
  Future<Either<List<CartEntity>, String>> call(NoParams params) async {
    return await _repository.getCarts();
  }
}
