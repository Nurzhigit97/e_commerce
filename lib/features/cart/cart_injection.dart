// import 'package:get_it/get_it.dart';
// import 'package:e_commerce/features/catalog/data/datasources/catalog_remote_data_source.dart';
// import 'package:e_commerce/features/catalog/data/repositories/catalog_repository_impl.dart';
// import 'package:e_commerce/features/catalog/domain/repositories/catalog_repository.dart';
// import 'package:e_commerce/features/catalog/domain/usecases/get_catalog/get_catalog_usecase.dart';
// import 'package:e_commerce/features/catalog/presentation/cubit/catalog_cubit.dart';
// import 'package:e_commerce/features/shared/core/network/dio_network.dart';

// final sl = GetIt.instance;

// cartInjection() {
//   // DATA SOURCES
//   sl.registerSingleton<CartRemoteDataSource>(
//     CartRemoteDataSourceImpl(DioNetwork.dio),
//   );

//   // REPOSITORIES
//   sl.registerSingleton<CartRepository>(
//     CartRepositoryImpl(sl<CartRemoteDataSource>()),
//   );

//   // USE CASES
//   sl.registerLazySingleton(() => GetCartUseCase(sl()));

//   // CUBITS
//   sl.registerFactory(() => CartCubit(sl<GetCartUseCase>()));
// }
