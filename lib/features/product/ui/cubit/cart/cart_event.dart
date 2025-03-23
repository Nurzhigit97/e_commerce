part of 'cart_bloc.dart';

sealed class CartEvent {}

class LoadCart extends CartEvent {}

class AddCartItem extends CartEvent {
  final ProductModel item;
  AddCartItem(this.item);
}

class RemoveCartItem extends CartEvent {
  final String id;
  RemoveCartItem(this.id);
}

class PlusCartItemQuantity extends CartEvent {
  final ProductModel item;
  PlusCartItemQuantity(this.item);
}

class MinusCartItemQuantity extends CartEvent {
  final ProductModel item;
  MinusCartItemQuantity(this.item);
}
