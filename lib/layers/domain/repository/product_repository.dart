import '../model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> searchProducts({
    required String searchQuery,
    String? sortType,
    String? sortDirection,
    double? minPrice,
    double? maxPrice,
  });
}
