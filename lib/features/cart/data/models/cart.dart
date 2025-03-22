import 'package:e_commerce/features/catalog/data/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;
  final List<Product> cartItems;

  const Cart({required this.products, required this.cartItems});

  Cart copyWith({List<Product>? products, List<Product>? cartItems}) {
    return Cart(
      products: products ?? this.products,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  int get totalQuantity {
    return cartItems.fold(0, (sum, item) => sum + 1);
  }

  bool get isEmpty {
    return cartItems.isEmpty;
  }

  bool get isNotEmpty {
    return cartItems.isNotEmpty;
  }

  @override
  List<Object> get props => [products, cartItems];

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(products: json['products'], cartItems: json['cartItems']);
  }

  Map<String, dynamic> toJson() {
    return {'products': products, 'cartItems': cartItems};
  }

  @override
  String toString() {
    return 'Cart(products: $products, cartItems: $cartItems)';
  }
}
