import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:e_commerce/features/product/ui/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemTile extends StatelessWidget {
  final ProductModel item;

  const CartItemTile({super.key, required this.item});

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
          SnackBar(content: Text('${item.title} удалён из корзины')),
        );
      },
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.title),
        subtitle: Text('\$${item.price?.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (item.quantity > 1) {
                  context.read<CartBloc>().add(
                    MinusCartItemQuantity(
                      item.copyWith(quantity: item.quantity - 1),
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
                    item.copyWith(quantity: item.quantity + 1),
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
