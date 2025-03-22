import 'package:e_commerce/features/product/domain/entities/rating_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final RatingEntity rating;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    image,
    price,
    rating,
  ];
}
