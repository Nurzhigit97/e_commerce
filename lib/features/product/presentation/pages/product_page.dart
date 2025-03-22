import 'package:e_commerce/features/product/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_state.dart';
import 'package:e_commerce/features/product/presentation/widgets/category_list.dart';
import 'package:e_commerce/features/product/presentation/widgets/product_card.dart';
import 'package:e_commerce/shared/core/di/service_locator.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_error_widget.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_input_widget.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ServiceLocator().productCubit,
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
            child: Column(
              children: [
                AppInputWidget(
                  filledColor: Theme.of(context).colorScheme.surface,
                  hintText: 'Поиск...',
                  onChanged:
                      (value) =>
                          context.read<ProductCubit>().searchProducts(value),
                ),
                const SizedBox(height: 12),
                BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return CategoryList(
                      categories: context.read<ProductCubit>().categories,
                      selectedCategory:
                          state is ProductLoaded
                              ? state.selectedCategory
                              : null,
                      onCategorySelected:
                          (category) => context
                              .read<ProductCubit>()
                              .selectCategory(category),
                    );
                  },
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return switch (state) {
                ProductLoading() => const SliverToBoxAdapter(
                  child: AppLoaderWidget(),
                ),
                ProductError(message: var message) => SliverToBoxAdapter(
                  child: AppErrorWidget(message: message),
                ),
                ProductLoaded(products: var products) => SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductCard(product: products[index]),
                    childCount: products.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
                _ => const SliverToBoxAdapter(child: SizedBox()),
              };
            },
          ),
        ],
      ),
    );
  }
}
