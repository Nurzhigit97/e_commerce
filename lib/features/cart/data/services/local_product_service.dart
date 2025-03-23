import 'dart:convert';

import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalProductDataSource {
  final SharedPreferences _prefs;
  static const String _cartKey = 'shopping_cart';

  LocalProductDataSource(this._prefs);

  Future<List<ProductModel>> getCart() async {
    final cartJson = _prefs.getStringList(_cartKey) ?? [];
    final cartItems =
        cartJson
            .map((item) => ProductModel.fromJson(jsonDecode(item)))
            .toList();
    return cartItems;
  }

  Future<void> addItem(ProductModel item) async {
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
  Future<void> plusItemQuantity(ProductModel item) async {
    final cart = await getCart();
    final index = cart.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      await _saveCart(cart);
    }
  }

  // minus item quantity
  Future<void> minusItemQuantity(ProductModel item) async {
    final cart = await getCart();
    final index = cart.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity - 1);
      await _saveCart(cart);
    }
  }

  Future<void> _saveCart(List<ProductModel> cart) async {
    final cartJson = cart.map((item) => jsonEncode(item.toJson())).toList();
    await _prefs.setStringList(_cartKey, cartJson);
  }
}
