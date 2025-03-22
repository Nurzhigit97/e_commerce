import 'package:e_commerce/features/cart/domain/entities/cart_product_entity.dart';

class CartProductModel extends CartProductEntity {
  const CartProductModel({required super.productId, required super.quantity});

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
