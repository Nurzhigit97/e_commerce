import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/features/cart/data/datasources/remote_cart_datasource.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_card.dart';
import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_error_widget.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => CartCubit(CartRemoteDataSource(DioNetwork.dio))..getCarts(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(title: Text('Корзина'), floating: true),
            BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return const SliverToBoxAdapter(child: AppLoaderWidget());
                } else if (state is CartError) {
                  return SliverToBoxAdapter(
                    child: AppErrorWidget(message: state.message),
                  );
                } else if (state is CartLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CartCard(cart: state.cart[index]),
                      childCount: state.cart.length,
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
