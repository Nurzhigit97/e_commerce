import 'package:e_commerce/features/product/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_state.dart';
import 'package:e_commerce/shared/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase _getProductsUseCase;
  ProductCubit(this._getProductsUseCase) : super(const ProductState.initial());

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    final result = await _getProductsUseCase(NoParams());
    result.fold(
      (products) => emit(ProductState.loaded(products)),
      (error) => emit(ProductState.error(error)),
    );
  }
}
