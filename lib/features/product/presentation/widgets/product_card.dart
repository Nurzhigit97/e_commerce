import 'package:e_commerce/features/product/data/models/product_model.dart';
import 'package:e_commerce/features/product/presentation/widgets/product_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => showProductDetails(context, product),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Center(child: Image.network(product.image, height: 100)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${product.price} ₽'),
                  Text(
                    '${product.rating.rate} ⭐',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
