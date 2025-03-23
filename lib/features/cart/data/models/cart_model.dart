import 'package:e_commerce/features/product/data/models/rating_model.dart';
import 'package:equatable/equatable.dart';

class CartModel extends Equatable {
  final int id;
  final String title;
  final double? price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  final int quantity;
  const CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      'rating': rating.toJson(),
      'quantity': quantity,
    };
  }

  CartModel copyWith({int? quantity}) {
    return CartModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    image,
    price,
    rating,
    quantity,
  ];
}
