import 'package:e_commerce/features/product/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded({
    required List<ProductEntity> products,
    String? selectedCategory,
  }) = _Loaded;
  const factory ProductState.error(String message) = _Error;
  const factory ProductState.empty() = _Empty;
}
