import 'package:e_commerce/features/cart/data/datasources/remote_cart_datasource.dart';
import 'package:e_commerce/features/cart/data/repositories/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/shared/core/network/dio_network.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

cartInjection() {
  // DATA SOURCES
  sl.registerSingleton<CartRemoteDataSource>(
    CartRemoteDataSourceImpl(DioNetwork.dio),
  );

  // REPOSITORIES
  sl.registerSingleton<CartRepository>(
    CartRepositoryImpl(sl<CartRemoteDataSource>()),
  );

  // USE CASES
  sl.registerLazySingleton(() => GetCartsUseCase(sl()));

  // CUBITS
  sl.registerFactory(() => CartCubit(sl<GetCartsUseCase>()));
}
