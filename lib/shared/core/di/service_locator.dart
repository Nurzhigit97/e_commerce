import 'package:dio/dio.dart';
import 'package:e_commerce/features/product/data/product_service/local_product_service.dart';
import 'package:e_commerce/features/product/data/product_service/product_service.dart';
import 'package:e_commerce/features/product/ui/cubit/cart/cart_bloc.dart';
import 'package:e_commerce/features/product/ui/cubit/product_cubit.dart';
import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:e_commerce/shared/core/utils/log/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  late final Dio _dio;
  late final SharedPreferences _prefs;
  late final ProductService _productService;
  late final ProductCubit _productCubit;
  late final CartBloc _cartBloc;

  Future<void> init() async {
    // Core
    initRootLogger();
    _prefs = await SharedPreferences.getInstance();

    // Network
    _dio = DioNetwork.dio;

    // Data Sources
    _productService = ProductService(_dio);

    // Cubits
    _productCubit = ProductCubit(_productService);
    _cartBloc = CartBloc(repository: LocalProductDataSource(_prefs));
  }

  // Getters
  ProductCubit get productCubit => _productCubit;
  SharedPreferences get prefs => _prefs;
  CartBloc get cartBloc => _cartBloc;
}
