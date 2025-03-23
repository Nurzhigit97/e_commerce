import 'dart:async';
import 'package:e_commerce/features/product/data/product_service/product_service.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService _productService;
  Timer? _debounce;
  List<ProductModel> _allProducts = [];
  String? _selectedCategory;
  String _searchQuery = '';

  ProductCubit(this._productService) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      final result = await _productService.getProducts();
      _allProducts = result;
      _filterProducts();
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
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
      ProductLoaded(
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
