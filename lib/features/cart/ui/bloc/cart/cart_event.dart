part of 'cart_bloc.dart';

sealed class CartEvent {}

class LoadCart extends CartEvent {}

class AddCartItem extends CartEvent {
  final CartModel item;
  AddCartItem(this.item);
}

class RemoveCartItem extends CartEvent {
  final String id;
  RemoveCartItem(this.id);
}

class PlusCartItemQuantity extends CartEvent {
  final CartModel item;
  PlusCartItemQuantity(this.item);
}

class MinusCartItemQuantity extends CartEvent {
  final CartModel item;
  MinusCartItemQuantity(this.item);
}
