import 'dart:async';
import 'package:e_commerce/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce/features/product/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/shared/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase _getProductsUseCase;
  Timer? _debounce;
  List<ProductEntity> _allProducts = [];
  String? _selectedCategory;
  String _searchQuery = '';

  ProductCubit(this._getProductsUseCase) : super(const ProductState.initial());

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    final result = await _getProductsUseCase(NoParams());
    result.fold((products) {
      _allProducts = products;
      _filterProducts();
    }, (error) => emit(ProductState.error(error)));
  }

  List<String> get categories =>
      _allProducts.map((product) => product.category).toSet().toList()..sort();

  void selectCategory(String? category) {
    _selectedCategory = category;
    _filterProducts();
  }

  void searchProducts(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchQuery = query.toLowerCase();
      _filterProducts();
    });
  }

  void _filterProducts() {
    var filteredProducts = _allProducts;

    // Apply category filter
    if (_selectedCategory != null) {
      filteredProducts =
          filteredProducts
              .where((product) => product.category == _selectedCategory)
              .toList();
    }

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filteredProducts =
          filteredProducts
              .where(
                (product) => product.title.toLowerCase().contains(_searchQuery),
              )
              .toList();
    }

    emit(
      ProductState.loaded(
        products: filteredProducts,
        selectedCategory: _selectedCategory,
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
