import 'dart:async';

import 'package:e_commerce/features/product/data/datasources/local_product_datasource.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final LocalProductDataSource repository;

  CartBloc({required this.repository}) : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddCartItem>(_onAddCartItem);
    on<RemoveCartItem>(_onRemoveCartItem);
    on<PlusCartItemQuantity>(_onPlusCartItemQuantity);
    on<MinusCartItemQuantity>(_onMinusCartItemQuantity);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final cart = await repository.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError('Failed to load cart: ${e.toString()}'));
    }
  }

  Future<void> _onPlusCartItemQuantity(
    PlusCartItemQuantity event,
    Emitter<CartState> emit,
  ) async {
    await repository.plusItemQuantity(event.item);
    final updatedCart = await repository.getCart();
    emit(CartLoaded(updatedCart));
  }

  Future<void> _onMinusCartItemQuantity(
    MinusCartItemQuantity event,
    Emitter<CartState> emit,
  ) async {
    await repository.minusItemQuantity(event.item);
    final updatedCart = await repository.getCart();
    emit(CartLoaded(updatedCart));
  }

  Future<void> _onAddCartItem(
    AddCartItem event,
    Emitter<CartState> emit,
  ) async {
    try {
      await repository.addItem(event.item);
      final updatedCart = await repository.getCart();
      emit(CartLoaded(updatedCart));
    } catch (e) {
      emit(AddCartItemError('Failed to add item: ${e.toString()}'));
    }
  }

  Future<void> _onRemoveCartItem(
    RemoveCartItem event,
    Emitter<CartState> emit,
  ) async {
    try {
      await repository.removeItem(event.id);
      final updatedCart = await repository.getCart();
      emit(CartLoaded(updatedCart));
    } catch (e) {
      emit(CartError('Failed to remove item: ${e.toString()}'));
    }
  }
}
