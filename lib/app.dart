import 'package:e_commerce/shared/core/resources/blocs/navigation/cubit/navigation_cubit.dart';
import 'package:e_commerce/shared/routes/app_routes.dart';
import 'package:e_commerce/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NavigationCubit())],
      child: MaterialApp(
        title: 'E-Commerce',
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        theme: theme,
        routes: AppRouter.routes,
        initialRoute: AppRouter.home,
      ),
    );
  }
}
