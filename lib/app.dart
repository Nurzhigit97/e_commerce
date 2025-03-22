import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/catalog/presentation/cubit/catalog_cubit.dart';
import 'package:e_commerce/shared/core/resources/blocs/navigation/cubit/navigation_cubit.dart';
import 'package:e_commerce/shared/core/utils/injections.dart';
import 'package:e_commerce/shared/routes/app_routes.dart';
import 'package:e_commerce/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<NavigationCubit>()),
        BlocProvider(create: (context) => sl<CartCubit>()),
        BlocProvider(create: (context) => sl<CatalogCubit>()),
      ],
      child: MaterialApp.router(
        title: 'E-Commerce',
        routerConfig: router.config(),
        debugShowCheckedModeBanner: false,
        theme: theme,
      ),
    );
  }
}
