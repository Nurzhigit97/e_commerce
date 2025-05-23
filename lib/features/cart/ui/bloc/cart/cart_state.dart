part of 'cart_bloc.dart';

sealed class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartModel> items;
  final double totalPrice;

  CartLoaded(this.items)
    : totalPrice = items.fold(
        0,
        (total, item) => total + (item.product.price ?? 0),
      );
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

// add cart item loading
class AddCartItemLoading extends CartState {}

class AddCartItemSuccess extends CartState {
  final CartModel item;
  AddCartItemSuccess(this.item);
}

// add cart item error
class AddCartItemError extends CartState {
  final String message;
  AddCartItemError(this.message);
}

// update cart item quantity loading
class PlusCartItemQuantityLoading extends CartState {}

class PlusCartItemQuantitySuccess extends CartState {}

class PlusCartItemQuantityError extends CartState {
  final String message;
  PlusCartItemQuantityError(this.message);
}

// minus cart item quantity loading

class MinusCartItemQuantityLoading extends CartState {}

class MinusCartItemQuantitySuccess extends CartState {}

class MinusCartItemQuantityError extends CartState {
  final String message;
  MinusCartItemQuantityError(this.message);
}
