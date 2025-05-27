import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../model/product_model.dart';
import '../repository/product_repository.dart';

class ProductUseCase {
  ProductUseCase(this.repository);

  final ProductRepository repository;

  Future<Either<Failure, List<ProductModel>>> fetch({
    required String query,
    String? sortType,
    String? sortDirection,
    double? minPrice,
    double? maxPrice,
  }) async {
    try {
      final result = await repository.searchProducts(
        searchQuery: query,
        sortType: sortType,
        sortDirection: sortDirection,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );

      return Right(result);
    } on DioException catch (exc) {
      return Left(NetworkFailure(exc.message ?? 'Network error'));
    } on Exception catch (exc) {
      return Left(ServerFailure(exc.toString()));
    }
  }
}
