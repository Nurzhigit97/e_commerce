import 'package:e_commerce/features/cart/cart_injection.dart';
import 'package:e_commerce/features/product/product_injection.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:e_commerce/shared/core/utils/log/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> initInjections() async {
  await initSharedPrefsInjections();
  await initDioInjections();

  // Catalog injections
  await productInjection();
  await cartInjection();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork();
}
