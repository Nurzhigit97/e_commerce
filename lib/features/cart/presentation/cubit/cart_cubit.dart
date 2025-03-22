import 'package:e_commerce/features/cart/data/datasource/remote_cart_datasource.dart';
import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRemoteDataSource _cartRemoteDataSource;

  CartCubit(this._cartRemoteDataSource) : super(CartInitial());

  Future<void> getCarts() async {
    emit(CartLoading());
    try {
      final result = await _cartRemoteDataSource.getCarts();
      emit(CartLoaded(cart: result));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  Future<void> add(CartModel product) async {
    emit(CartLoading());
    try {
      await _cartRemoteDataSource.addToCart(product);
      emit(CartLoaded(cart: await _cartRemoteDataSource.getCarts()));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
