import 'dart:convert';

import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCartDataSource {
  final SharedPreferences _prefs;
  static const String _cartKey = 'shopping_cart';

  LocalCartDataSource(this._prefs);

  Future<List<CartModel>> getCart() async {
    final cartJson = _prefs.getStringList(_cartKey) ?? [];
    final cartItems =
        cartJson.map((item) => CartModel.fromJson(jsonDecode(item))).toList();
    return cartItems;
  }

  Future<void> addItem(CartModel item) async {
    final cart = await getCart();
    cart.add(item);
    await _saveCart(cart);
  }

  Future<void> removeItem(String id) async {
    final cart = await getCart();
    cart.removeWhere((item) => item.id == int.parse(id));
    await _saveCart(cart);
  }

  // plus item quantity
  Future<void> plusItemQuantity(CartModel item) async {
    final cart = await getCart();
    final index = cart.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      await _saveCart(cart);
    }
  }

  // minus item quantity
  Future<void> minusItemQuantity(CartModel item) async {
    final cart = await getCart();
    final index = cart.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity - 1);
      await _saveCart(cart);
    }
  }

  Future<void> _saveCart(List<CartModel> cart) async {
    final cartJson = cart.map((item) => jsonEncode(item.toJson())).toList();
    await _prefs.setStringList(_cartKey, cartJson);
  }
}
