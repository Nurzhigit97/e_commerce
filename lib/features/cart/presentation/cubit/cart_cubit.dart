import 'package:e_commerce/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/shared/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartsUseCase _getCartsUseCase;

  CartCubit(this._getCartsUseCase) : super(const CartState.initial());

  Future<void> getCarts() async {
    emit(const CartState.loading());
    final result = await _getCartsUseCase(NoParams());

    result.fold(
      (success) => emit(CartState.loaded(cart: success)),
      (failure) => emit(CartState.error(message: failure)),
    );
  }
}
