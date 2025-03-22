import 'package:e_commerce/features/product/data/datasources/remote_product_datasource.dart';
import 'package:e_commerce/features/product/data/repositories/product_repository.dart';
import 'package:e_commerce/features/product/domain/usecases/get_products_usecase.dart';
import 'package:e_commerce/features/product/presentation/cubit/product_cubit.dart';
import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

productInjection() {
  // DATA SOURCES
  sl.registerSingleton<ProductRemoteDataSource>(
    ProductRemoteDataSourceImpl(DioNetwork.dio),
  );

  // REPOSITORIES
  sl.registerSingleton<ProductRepository>(
    ProductRepository(sl<ProductRemoteDataSource>()),
  );

  // USE CASES
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));

  // CUBITS
  sl.registerFactory(() => ProductCubit(sl<GetProductsUseCase>()));
}
