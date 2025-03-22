import 'package:e_commerce/shared/core/resources/blocs/navigation/cubit/navigation_cubit.dart';
import 'package:e_commerce/shared/core/utils/injections.dart';
import 'package:e_commerce/shared/routes/app_routes.dart';
import 'package:e_commerce/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<NavigationCubit>())],
      child: MaterialApp.router(
        title: 'E-Commerce',
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        theme: theme,
      ),
    );
  }
}
