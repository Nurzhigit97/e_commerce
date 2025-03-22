import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({required List<CartEntity> cart}) = _Loaded;
  const factory CartState.error({required String message}) = _Error;
}
