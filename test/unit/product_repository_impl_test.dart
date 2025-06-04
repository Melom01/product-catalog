import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:product_catalog/layers/data/model/search_response.dart';
import 'package:product_catalog/layers/data/repository/product_repository_impl.dart';
import '../mock/mock_document.dart';
import '../mock/mock_product_datasource.dart';

void main() {
  late MockProductDataSource mockDataSource;
  late ProductRepositoryImpl repository;

  setUpAll(() {
    registerFallbackValue(FakeDocument());
  });

  setUp(() {
    mockDataSource = MockProductDataSource();
    repository = ProductRepositoryImpl(dataSource: mockDataSource);
  });

  group('searchProducts', () {
    test('Returns list of ProductModel when data source returns valid GroupedHit', () async {
      final document = Document(
        affiliateUrl: '',
        brand: '',
        brandId: '',
        category: '',
        category1: '',
        category2: '',
        description: '',
        discountPercentage: null,
        hasImage: null,
        id: '',
        image: '',
        imageMerchant: '',
        listPrice: null,
        merchant: 'Test merchant',
        merchantId: '',
        newOffer: null,
        sellingPrice: 10,
        title: 'Test product',
        url: '',
        isMerchantCard: null,
        merchantToken: '',
      );

      final groupedHit = GroupedHit(hits: [Hit(document: document)]);
      final response = SearchResponse(groupedHits: [groupedHit]);

      when(
        () => mockDataSource.searchProducts(
          query: 'test',
          sortType: null,
          sortDirection: null,
          minPrice: null,
          maxPrice: null,
        ),
      ).thenAnswer((_) async => response);

      final result = await repository.searchProducts(searchQuery: 'test');

      expect(result.length, 1);
      expect(result.first.title, 'Test product');
    });
  });
}
