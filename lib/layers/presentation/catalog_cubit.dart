import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/model/product_model.dart';
import '../domain/use_case/product_use_case.dart';
import 'catalog_state.dart';

class CatalogCubit extends Cubit<CatalogState> {
  CatalogCubit(this._productsUseCase) : super(const CatalogState()) {
    searchBarTextEditingController = TextEditingController()
      ..addListener(() {
        _handleSearchBarControllerListener(searchBarTextEditingController.text);
      });
    minPriceTextEditingController = TextEditingController()
      ..addListener(() {
        _handleMinPriceTextEditingControllerListener(
          minPriceTextEditingController.text,
        );
      });
    maxPriceTextEditingController = TextEditingController()
      ..addListener(() {
        _handleMaxPriceTextEditingControllerListener(
          maxPriceTextEditingController.text,
        );
      });
  }

  late TextEditingController searchBarTextEditingController;
  late TextEditingController minPriceTextEditingController;
  late TextEditingController maxPriceTextEditingController;
  final ProductUseCase _productsUseCase;

  void searchProduct(String query) {
    if (query.trim().isNotEmpty) {
      _fetchProducts(
        query: query,
        minPrice: state.minPrice,
        maxPrice: state.maxPrice,
        sortDirection: state.sortDirection,
      );
    }
  }

  void changeProductsSorting(String? sortDirection) {
    switch (sortDirection) {
      case 'a_z':
        final sorted = List<ProductModel>.from(state.products);
        sorted.sort(
          (a, z) => a.title.toLowerCase().compareTo(z.title.toLowerCase()),
        );
        emit(state.copyWith(products: sorted, sortDirection: sortDirection));
      case 'z_a':
        final sorted = List<ProductModel>.from(state.products);
        sorted.sort(
          (a, z) => z.title.toLowerCase().compareTo(a.title.toLowerCase()),
        );
        emit(state.copyWith(products: sorted, sortDirection: sortDirection));
      default:
        _fetchProducts(
          query: searchBarTextEditingController.text,
          minPrice: state.minPrice,
          maxPrice: state.maxPrice,
          sortDirection: sortDirection,
        );
    }
  }

  void filterByPrice({String? minPrice, String? maxPrice}) {
    final pricesHaveChanged =
        minPrice != state.minPrice || maxPrice != state.maxPrice;

    if (pricesHaveChanged) {
      _fetchProducts(
        query: searchBarTextEditingController.text,
        minPrice: minPrice,
        maxPrice: maxPrice,
        sortDirection: state.sortDirection,
      );
      emit(state.copyWith(minPrice: minPrice, maxPrice: maxPrice));
    }
  }

  void _handleSearchBarControllerListener(String controllerText) {
    emit(state.copyWith(searchBarControllerText: controllerText));
  }

  void _handleMinPriceTextEditingControllerListener(String controllerText) {
    emit(state.copyWith(searchBarControllerText: controllerText));
  }

  void _handleMaxPriceTextEditingControllerListener(String controllerText) {
    emit(state.copyWith(searchBarControllerText: controllerText));
  }

  Future<void> _fetchProducts({
    required String query,
    String? sortType,
    String? sortDirection,
    String? minPrice,
    String? maxPrice,
  }) async {
    emit(state.copyWith(isLoading: true));

    final result = await _productsUseCase.fetch(
      query: query,
      sortType: sortType ?? 'selling_price',
      sortDirection: sortDirection ?? 'asc',
      minPrice: double.tryParse(minPrice ?? ''),
      maxPrice: double.tryParse(maxPrice ?? ''),
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            products: [],
            sortDirection: sortDirection,
            minPrice: minPrice,
            maxPrice: maxPrice,
            isLoading: false,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            products: products,
            sortDirection: sortDirection,
            minPrice: minPrice,
            maxPrice: maxPrice,
            isLoading: false,
          ),
        );
      },
    );
  }
}
