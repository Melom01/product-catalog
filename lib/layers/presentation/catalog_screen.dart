import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/di/di.dart';
import '../../core/ui/theme/extensions/theme_config.dart';
import '../../core/ui/widgets/catalog/catalog_product.dart';
import '../../core/ui/widgets/catalog/catalog_product_skeleton.dart';
import '../../core/ui/widgets/catalog_search_bar.dart';
import '../../core/ui/widgets/filter/catalog_filter_bottom_sheet.dart';
import '../../core/ui/widgets/filter/catalog_filter_chip.dart';
import '../../core/ui/widgets/filter/filter_options_bottom_sheet_content.dart';
import '../../core/ui/widgets/filter/sort_options_bottom_sheet_content.dart';
import '../../core/utils/icon_constants.dart';
import '../../l10n/l10n.dart';
import 'catalog_cubit.dart';
import 'catalog_state.dart';
import 'model/sort_option.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return BlocProvider(
      create: (context) => injector<CatalogCubit>(),
      child: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) {
          final cubit = context.read<CatalogCubit>();
          final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
          final crossAxisCount = isPortrait ? 2 : 4;

          return Scaffold(
            backgroundColor: context.colorScheme.catalogPrimaryBackground,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    controlsSection(context, cubit, state),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: (state.products.isNotEmpty || state.isLoading)
                          ? GridView.builder(
                              padding: EdgeInsets.only(bottom: 16.h),
                              itemCount: state.isLoading ? 20 : state.products.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 12.h,
                                childAspectRatio: isTablet ? (isPortrait ? 1 : 0.85) : 0.45,
                              ),
                              itemBuilder: (context, index) {
                                if (state.isLoading) {
                                  return const CatalogProductSkeleton();
                                } else {
                                  final product = state.products[index];

                                  return CatalogProduct(
                                    imageUrl: product.imageUrl,
                                    title: product.title,
                                    merchant: product.merchant,
                                    price: product.sellingPrice.toString(),
                                    installmentPrice: product.installmentPrice.toStringAsFixed(2),
                                  );
                                }
                              },
                            )
                          : Center(
                              child: Text(
                                context.l10n.emptyState,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: context.colorScheme.catalogSecondaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget controlsSection(BuildContext context, CatalogCubit cubit, CatalogState state) {
    final sortOptions = [
      SortOption(key: 'asc', label: context.l10n.increasingPrice),
      SortOption(key: 'desc', label: context.l10n.decreasingPrice),
      SortOption(key: 'a_z', label: context.l10n.aToZName),
      SortOption(key: 'z_a', label: context.l10n.zToAName),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 57.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            context.l10n.catalogTitle,
            style: TextStyle(
              color: context.colorScheme.catalogHeader,
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
              letterSpacing: 0,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CatalogSearchBar(
          controller: cubit.searchBarTextEditingController,
          onSearch: () {
            FocusScope.of(context).unfocus();
            cubit.searchProduct(cubit.searchBarTextEditingController.text);
          },
        ),
        SizedBox(height: 13.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CatalogFilterChip(
              iconPath: AppIcons.filter,
              label: context.l10n.filterChipLabel,
              onPressed: () {
                CatalogFilterBottomSheet.show(
                  context: context,
                  title: context.l10n.filterChipLabel,
                  child: FilterOptionsBottomSheetContent(
                    minPriceController: cubit.minPriceTextEditingController,
                    maxPriceController: cubit.maxPriceTextEditingController,
                    onShowResults: (String? minPrice, String? maxPrice) {
                      cubit.filterByPrice(
                        minPrice: minPrice,
                        maxPrice: maxPrice,
                      );
                      Navigator.pop(context);
                    },
                  ),
                  onClose: () => Navigator.pop(context),
                );
              },
            ),
            SizedBox(width: 8.w),
            CatalogFilterChip(
              iconPath: AppIcons.order,
              label: context.l10n.orderChipLabel,
              onPressed: () {
                CatalogFilterBottomSheet.show(
                  context: context,
                  title: context.l10n.orderChipLabel,
                  child: BlocProvider.value(
                    value: BlocProvider.of<CatalogCubit>(context),
                    child: BlocBuilder<CatalogCubit, CatalogState>(
                      builder: (context, state) {
                        return SortOptionsBottomSheetContent(
                          selected: state.sortDirection ?? sortOptions.first.key,
                          options: sortOptions,
                          onChanged: (String? selectedOption) {
                            cubit.changeProductsSorting(selectedOption);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                  portraitMaxSize: 0.45,
                  onClose: () => Navigator.pop(context),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
