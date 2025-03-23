import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/ui/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:e_commerce/features/product/ui/widgets/product_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            InkWell(
              onTap: () => showProductDetails(context, product),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Center(child: Image.network(product.image, height: 100)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${product.price} ₽'),
                IconButton(
                  onPressed: () {
                    final isInCart =
                        context.read<CartBloc>().state is CartLoaded &&
                        (context.read<CartBloc>().state as CartLoaded).items
                            .any((item) => item.id == product.id);

                    if (isInCart) {
                      context.read<CartBloc>().add(
                        RemoveCartItem(product.id.toString()),
                      );
                    } else {
                      context.read<CartBloc>().add(
                        AddCartItem(
                          CartModel(
                            id: product.id,
                            product: product,
                            quantity: 0,
                          ),
                        ),
                      );
                    }
                  },
                  icon: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      final isInCart =
                          state is CartLoaded &&
                          state.items.any((item) => item.id == product.id);
                      return Icon(
                        isInCart ? Icons.favorite : Icons.favorite_border,
                        color: isInCart ? Colors.red : Colors.grey,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
