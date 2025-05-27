import '../../../core/network/client.dart';
import '../model/search_response.dart';

class ProductDataSource {
  ProductDataSource(this.client);

  final DioClient client;

  Future<SearchResponse> searchProducts({
    required String query,
    String partnerId = 'scalapayappit',
    String source = 'trovaprezzi',
    String language = 'it',
    String country = 'IT',
    String? sortType = 'selling_price',
    String? sortDirection = 'asc',
    String? filterBy,
    int? page,
    int? perPage,
    double? minPrice,
    double? maxPrice,
  }) async {
    final response = await client.dio.get<dynamic>(
      'v1/products/search',
      queryParameters: {
        'q': query,
        'page': page,
        'per_page': perPage,
        'filter_by': filterBy,
        'sort_by': '$sortType:$sortDirection',
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'partnerId': partnerId,
        'source': source,
        'language': language,
        'country': country,
      },
    );

    final data = response.data;

    if (data is! Map<String, dynamic>) {
      throw Exception('Invalid response format');
    }

    return SearchResponse.fromJson(data);
  }
}
