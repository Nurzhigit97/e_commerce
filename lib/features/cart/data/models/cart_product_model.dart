import 'package:equatable/equatable.dart';

class CartProductModel extends Equatable {
  final int productId;
  final int quantity;

  const CartProductModel({required this.productId, required this.quantity});

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }

  @override
  List<Object?> get props => [productId, quantity];
}
