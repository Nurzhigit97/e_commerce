import 'package:e_commerce/features/product/data/models/product_model.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final String? selectedCategory;

  ProductLoaded({required this.products, this.selectedCategory});
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});
}
