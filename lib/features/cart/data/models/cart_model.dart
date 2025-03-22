import 'package:e_commerce/features/cart/data/models/cart_product_model.dart';
import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProductModel> products;

  const CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      date: DateTime.parse(json['date']),
      userId: json['userId'],
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
      'products': products.map((product) => (product).toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [id, userId, date, products];
}
