import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:product_catalog/core/error/failure.dart';
import 'package:product_catalog/layers/domain/model/product_model.dart';
import 'package:product_catalog/layers/presentation/catalog_cubit.dart';
import 'package:product_catalog/layers/presentation/catalog_state.dart';
import '../mock/mock_product_use_case.dart';

void main() {
  late MockProductUseCase mockUseCase;
  late CatalogCubit cubit;

  final testProducts = [
    ProductModel(
      title: 'Nike Air',
      merchant: 'FootLocker',
      sellingPrice: 90,
      installmentPrice: 30,
      imageUrl: '',
    ),
    ProductModel(
      title: 'Adidas Ultra',
      merchant: 'Zalando',
      sellingPrice: 120,
      installmentPrice: 40,
      imageUrl: '',
    ),
  ];

  setUp(() {
    mockUseCase = MockProductUseCase();
    cubit = CatalogCubit(mockUseCase);
    addTearDown(() => cubit.close());
  });

  test('Initial state', () {
    expect(cubit.state.isLoading, false);
    expect(cubit.state.products, isEmpty);
    expect(cubit.state.minPrice, isNull);
    expect(cubit.state.maxPrice, isNull);
  });

  test('Listener searchBarTextEditingController - update the state', () async {
    final cubit = CatalogCubit(mockUseCase);
    final future = expectLater(
      cubit.stream,
      emitsThrough(
        isA<CatalogState>().having(
          (s) => s.searchBarControllerText,
          'text',
          'test',
        ),
      ),
    );

    cubit.searchBarTextEditingController.text = 'test';
    await future;
  });

  blocTest<CatalogCubit, CatalogState>(
    'filterByPrice() - emits loading then filtered products',
    build: () {
      when(
        () => mockUseCase.fetch(
          query: '',
          sortType: any(named: 'sortType'),
          sortDirection: any(named: 'sortDirection'),
          minPrice: 80,
          maxPrice: 100,
        ),
      ).thenAnswer((_) async => Right([testProducts[0]]));

      return CatalogCubit(mockUseCase);
    },
    act: (cubit) => cubit.filterByPrice(minPrice: '80', maxPrice: '100'),
    expect: () => [
      isA<CatalogState>().having((s) => s.isLoading, 'loading', true),
      isA<CatalogState>()
          .having((s) => s.isLoading, 'loading', true)
          .having((s) => s.minPrice, 'min price', '80')
          .having((s) => s.maxPrice, 'max price', '100'),
      isA<CatalogState>()
          .having((s) => s.isLoading, 'not loading', false)
          .having((s) => s.products.length, 'filtered products', 1)
          .having((s) => s.minPrice, 'min price', '80')
          .having((s) => s.maxPrice, 'max price', '100'),
    ],
  );

  blocTest<CatalogCubit, CatalogState>(
    'filterByPrice() - emit error if the use case fails',
    build: () {
      when(
        () => mockUseCase.fetch(
          query: '',
          sortType: any(named: 'sortType'),
          sortDirection: any(named: 'sortDirection'),
          minPrice: 80,
          maxPrice: 100,
        ),
      ).thenAnswer((_) async => const Left(ServerFailure('server failure')));

      return CatalogCubit(mockUseCase);
    },
    act: (cubit) => cubit.filterByPrice(minPrice: '80', maxPrice: '100'),
    expect: () => [
      isA<CatalogState>().having((s) => s.isLoading, 'loading', true),
      isA<CatalogState>()
          .having((s) => s.isLoading, 'loading', true)
          .having((s) => s.minPrice, 'min price', '80')
          .having((s) => s.maxPrice, 'max price', '100'),
      isA<CatalogState>()
          .having((s) => s.isLoading, 'not loading', false)
          .having((s) => s.minPrice, 'min price', '80')
          .having((s) => s.maxPrice, 'max price', '100')
          .having((s) => s.products, 'products', isEmpty),
    ],
  );

  blocTest<CatalogCubit, CatalogState>(
    'changeProductsSorting - order product from Z to A (z_a)',
    build: () {
      final cubit = CatalogCubit(mockUseCase);
      cubit.emit(cubit.state.copyWith(products: testProducts));
      return cubit;
    },
    act: (cubit) => cubit.changeProductsSorting('z_a'),
    expect: () => [
      isA<CatalogState>()
          .having((s) => s.products.first.title, 'first is Nike', 'Nike Air')
          .having((s) => s.sortDirection, 'sortDirection', 'z_a'),
    ],
  );
}
