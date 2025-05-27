import 'package:equatable/equatable.dart';

import '../domain/model/product_model.dart';

class CatalogState extends Equatable {
  const CatalogState({
    this.isLoading = false,
    this.products = const <ProductModel>[],
    this.searchBarControllerText,
    this.sortDirection,
    this.minPrice,
    this.maxPrice,
  });

  final bool isLoading;
  final List<ProductModel> products;
  final String? searchBarControllerText;
  final String? sortDirection;
  final String? minPrice;
  final String? maxPrice;

  @override
  List<Object?> get props => [
    isLoading,
    products,
    searchBarControllerText,
    sortDirection,
    minPrice,
    maxPrice,
  ];

  CatalogState copyWith({
    bool? isLoading,
    String? searchBarControllerText,
    String? sortDirection,
    String? minPrice,
    String? maxPrice,
    List<ProductModel>? products,
  }) {
    return CatalogState(
      isLoading: isLoading ?? this.isLoading,
      searchBarControllerText:
          searchBarControllerText ?? this.searchBarControllerText,
      sortDirection: sortDirection ?? this.sortDirection,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      products: products ?? this.products,
    );
  }
}
