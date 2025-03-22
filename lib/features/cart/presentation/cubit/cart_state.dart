import 'package:e_commerce/features/cart/data/models/cart_model.dart';

sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartModel> cart;
  CartLoaded({required this.cart});
}

class CartError extends CartState {
  final String message;
  CartError({required this.message});
}
