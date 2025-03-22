import 'package:e_commerce/features/catalog/data/models/product.dart';
import 'package:e_commerce/shared/core/bloc/base_state.dart';

class CatalogState extends BaseState {
  final List<Product> products;

  const CatalogState({required this.products, super.isLoading, super.error});

  factory CatalogState.initial() => const CatalogState(products: []);

  CatalogState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return CatalogState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [...super.props, products];
}
