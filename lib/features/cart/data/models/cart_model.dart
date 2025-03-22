import 'package:e_commerce/features/cart/data/models/cart_product_model.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products:
          (json['products'] as List)
              .map((product) => CartProductModel.fromJson(product))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'products':
          products
              .map((product) => (product as CartProductModel).toJson())
              .toList(),
    };
  }
}
