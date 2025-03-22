import 'package:e_commerce/features/product/domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel({required super.rate, required super.count});
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate:
          (json['rate'] is int)
              ? (json['rate'] as int).toDouble()
              : json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
