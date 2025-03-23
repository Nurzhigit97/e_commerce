import 'package:e_commerce/features/cart/data/models/cart_model.dart';
import 'package:e_commerce/features/cart/ui/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCard extends StatelessWidget {
  final CartModel item;

  const CartCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        context.read<CartBloc>().add(RemoveCartItem(item.id.toString()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${item.product.title} удалён из корзины')),
        );
      },
      child: ListTile(
        leading: Image.network(item.product.image),
        title: Text(item.product.title),
        subtitle: Text('\$${item.product.price?.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (item.quantity > 1) {
                  context.read<CartBloc>().add(
                    MinusCartItemQuantity(
                      CartModel(
                        id: item.id,
                        product: item.product,
                        quantity: item.quantity - 1,
                      ),
                    ),
                  );
                } else {
                  context.read<CartBloc>().add(
                    RemoveCartItem(item.id.toString()),
                  );
                }
              },
            ),
            Text('${item.quantity}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<CartBloc>().add(
                  PlusCartItemQuantity(
                    CartModel(
                      id: item.id,
                      product: item.product,
                      quantity: item.quantity + 1,
                    ),
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
