import 'package:auto_route/auto_route.dart';
import 'app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeNavigator.page,
      children: [
        AutoRoute(page: CatalogRoute.page, initial: true),
        AutoRoute(page: CartRoute.page),
      ],
    ),
  ];
}
