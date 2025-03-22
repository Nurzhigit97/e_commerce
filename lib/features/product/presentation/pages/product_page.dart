import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/features/product/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_state.dart';
import 'package:e_commerce/shared/core/resources/widgets/app_error_widget.dart';
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
      appBar: AppBar(title: const Text('Товары')),
      body: BlocProvider(
        create:
            (context) => ProductCubit(sl<GetProductsUseCase>())..getProducts(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const AppLoaderWidget(),
              loaded:
                  (products) => GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                        ),
                    itemCount: products.length,
                    itemBuilder:
                        (context, index) => Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  products[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 10),
                                Image.network(
                                  products[index].image,
                                  height: 100,
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${products[index].price} ₽'),
                                    Text(
                                      '${products[index].rating.rate} ⭐',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
              error: (message) => AppErrorWidget(message: message),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
