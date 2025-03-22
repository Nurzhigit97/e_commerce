import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/features/product/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_state.dart';
import 'package:e_commerce/features/product/presentation/widgets/product_card.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_error_widget.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_input_widget.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_loader_widget.dart';
import 'package:e_commerce/shared/core/utils/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ProductCubit(sl<GetProductsUseCase>())..getProducts(),
        child: const ProductView(),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(title: Text('Товары'), floating: true),
          SliverToBoxAdapter(
            child: AppInputWidget(
              filledColor: Theme.of(context).colorScheme.surface,
              hintColor: Theme.of(context).colorScheme.onSurface,
              hintText: 'Поиск...',
              onChanged:
                  (value) => context.read<ProductCubit>().searchProducts(value),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading:
                    () => const SliverToBoxAdapter(child: AppLoaderWidget()),
                loaded:
                    (products) => SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            ProductCard(product: products[index]),
                        childCount: products.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                    ),
                error:
                    (message) => SliverToBoxAdapter(
                      child: AppErrorWidget(message: message),
                    ),
                orElse: () => const SliverToBoxAdapter(child: SizedBox()),
              );
            },
          ),
        ],
      ),
    );
  }
}
