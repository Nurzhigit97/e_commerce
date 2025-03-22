// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:e_commerce/features/cart/presentation/pages/cart_page.dart'
    as _i1;
import 'package:e_commerce/features/home_navigator.dart' as _i2;
import 'package:e_commerce/features/product/presentation/pages/product_page.dart'
    as _i3;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i4.PageRouteInfo<void> {
  const CartRoute({List<_i4.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.CartPage();
    },
  );
}

/// generated route for
/// [_i2.HomeNavigator]
class HomeNavigator extends _i4.PageRouteInfo<void> {
  const HomeNavigator({List<_i4.PageRouteInfo>? children})
    : super(HomeNavigator.name, initialChildren: children);

  static const String name = 'HomeNavigator';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeNavigator();
    },
  );
}

/// generated route for
/// [_i3.ProductPage]
class ProductRoute extends _i4.PageRouteInfo<void> {
  const ProductRoute({List<_i4.PageRouteInfo>? children})
    : super(ProductRoute.name, initialChildren: children);

  static const String name = 'ProductRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProductPage();
    },
  );
}
