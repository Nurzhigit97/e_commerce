import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_card.dart';
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
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Корзина'), floating: true),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SliverToBoxAdapter(child: SizedBox()),
                  loading:
                      () => const SliverToBoxAdapter(child: AppLoaderWidget()),
                  loaded:
                      (carts) => SliverList(
                        delegate: SliverChildBuilderDelegate((
                          context,
                          cartIndex,
                        ) {
                          final cart = carts[cartIndex];
                          return CartCard(cart: cart);
                        }, childCount: carts.length),
                      ),
                  error:
                      (message) => SliverToBoxAdapter(
                        child: AppErrorWidget(message: message),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
