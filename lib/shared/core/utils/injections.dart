import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:e_commerce/shared/core/utils/log/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
late DioNetwork dioNetwork;

Future<void> initDependencies() async {
  await initSharedPreferences();
  await initDioNetwork();
}

Future<void> initSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

Future<void> initDioNetwork() async {
  initRootLogger();
  dioNetwork = DioNetwork();
}
