import '../../domain/model/product_model.dart';
import '../../domain/repository/product_repository.dart';
import '../datasource/product_datasource.dart';
import '../mapper/product_mapper.dart';
import '../model/search_response.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.dataSource});

  final ProductDataSource dataSource;

  @override
  Future<List<ProductModel>> searchProducts({
    required String searchQuery,
    String? sortType,
    String? sortDirection,
    double? minPrice,
    double? maxPrice,
  }) async {
    final response = await dataSource.searchProducts(
      query: searchQuery,
      sortType: sortType,
      sortDirection: sortDirection,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );

    final documents = (response.groupedHits ?? [])
        .expand((group) => group.hits ?? [])
        .map((hit) => hit.document)
        .where((doc) => doc != null)
        .cast<Document>()
        .toList();

    return documents.map(ProductMapper.fromDocument).toList();
  }
}
