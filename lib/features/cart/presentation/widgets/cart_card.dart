import 'package:e_commerce/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cart});

  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
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
                title: Text('Product ID: ${product.productId}'),
                trailing: Text('Quantity: ${product.quantity}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
