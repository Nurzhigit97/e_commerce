import 'package:e_commerce/features/home_navigator.dart';
import 'package:e_commerce/features/product/ui/pages/cart_page.dart';
import 'package:e_commerce/features/product/ui/pages/product_page.dart';

class AppRouter {
  static const String home = '/home';
  static const String cart = '/cart';
  static const String product = '/product';

  static final routes = {
    home: (context) => const HomeNavigator(),
    cart: (context) => const CartPage(),
    product: (context) => const ProductPage(),
  };
}
