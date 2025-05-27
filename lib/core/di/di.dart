import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../layers/data/datasource/product_datasource.dart';
import '../../layers/data/repository/product_repository_impl.dart';
import '../../layers/domain/repository/product_repository.dart';
import '../../layers/domain/use_case/product_use_case.dart';
import '../../layers/presentation/catalog_cubit.dart';
import '../network/client.dart';

final GetIt injector = GetIt.instance;

Future<void> registerDependencies() async {
  injector
    ..registerLazySingleton(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://catalog-api.dev-cat.scalapay.com/',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {'Accept': 'application/json'},
        ),
      ),
    )
    ..registerLazySingleton(() => DioClient(injector<Dio>()))
    ..registerLazySingleton(() => ProductDataSource(injector<DioClient>()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(dataSource: injector<ProductDataSource>()),
    )
    ..registerLazySingleton<ProductUseCase>(
      () => ProductUseCase(injector<ProductRepository>()),
    )
    ..registerFactory(() => CatalogCubit(injector<ProductUseCase>()));
}
