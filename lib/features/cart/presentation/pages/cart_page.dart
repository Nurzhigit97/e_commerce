import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_error_widget.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_loader_widget.dart';
import 'package:e_commerce/shared/core/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(sl<GetCartsUseCase>())..getCarts(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Корзина')),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const AppLoaderWidget(),
              loaded:
                  (carts) => ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, cartIndex) {
                      final cart = carts[cartIndex];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Cart #${cart.id} - Date: ${cart.date.toString().split(' ')[0]}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cart.products.length,
                              itemBuilder: (context, productIndex) {
                                final product = cart.products[productIndex];
                                return ListTile(
                                  title: Text(
                                    'Product ID: ${product.productId}',
                                  ),
                                  trailing: Text(
                                    'Quantity: ${product.quantity}',
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              error: (message) => AppErrorWidget(message: message),
            );
          },
        ),
      ),
    );
  }
}
