import 'package:e_commerce/features/cart/domain/entities/cart_product_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime date;
  final List<CartProductEntity> products;

  const CartEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  @override
  List<Object?> get props => [id, userId, date, products];
}
