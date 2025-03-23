import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final int id;
  final ProductModel product;
  final int quantity;
  const CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'product': product.toJson(), 'quantity': quantity};
  }

  CartModel copyWith({int? quantity}) {
    return CartModel(
      id: id,
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [id, product, quantity];
}
