import 'package:e_commerce/features/product/presentation/widgets/product_view.dart';
import 'package:e_commerce/shared/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ServiceLocator().productCubit..getProducts(),
        child: const ProductView(),
      ),
    );
  }
}
