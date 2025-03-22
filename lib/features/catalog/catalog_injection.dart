// import 'package:get_it/get_it.dart';
// import 'package:e_commerce/features/catalog/data/datasources/catalog_remote_data_source.dart';
// import 'package:e_commerce/features/catalog/data/repositories/catalog_repository_impl.dart';
// import 'package:e_commerce/features/catalog/domain/repositories/catalog_repository.dart';
// import 'package:e_commerce/features/catalog/domain/usecases/get_catalog/get_catalog_usecase.dart';
// import 'package:e_commerce/features/catalog/presentation/cubit/catalog_cubit.dart';
// import 'package:e_commerce/features/shared/core/network/dio_network.dart';

// final sl = GetIt.instance;

// catalogInjection() {
//   // DATA SOURCES
//   sl.registerSingleton<CatalogRemoteDataSource>(
//     CatalogRemoteDataSourceImpl(DioNetwork.dio),
//   );

//   // REPOSITORIES
//   sl.registerSingleton<CatalogRepository>(
//     CatalogRepositoryImpl(sl<CatalogRemoteDataSource>()),
//   );

//   // USE CASES
//   sl.registerLazySingleton(() => GetCatalogUseCase(sl()));

//   // CUBITS
//   sl.registerFactory(() => CatalogCubit(sl<GetCatalogUseCase>()));
// }
