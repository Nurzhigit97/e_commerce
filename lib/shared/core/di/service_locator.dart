import 'package:dio/dio.dart';
import 'package:e_commerce/features/cart/data/datasource/remote_cart_datasource.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/product/data/datasources/remote_product_datasource.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:e_commerce/shared/core/utils/log/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  late final Dio _dio;
  late final SharedPreferences _prefs;
  late final ProductRemoteDataSource _productDataSource;
  late final CartRemoteDataSource _cartDataSource;
  late final ProductCubit _productCubit;
  late final CartCubit _cartCubit;

  Future<void> init() async {
    // Core
    initRootLogger();
    _prefs = await SharedPreferences.getInstance();

    // Network
    _dio = DioNetwork.dio;

    // Data Sources
    _productDataSource = ProductRemoteDataSource(_dio);
    _cartDataSource = CartRemoteDataSource(_dio);

    // Cubits
    _productCubit = ProductCubit(_productDataSource);
    _cartCubit = CartCubit(_cartDataSource);
  }

  // Getters
  ProductCubit get productCubit => _productCubit;
  CartCubit get cartCubit => _cartCubit;
  SharedPreferences get prefs => _prefs;
}
