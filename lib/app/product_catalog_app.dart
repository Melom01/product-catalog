import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/ui/theme/dark_theme.dart';
import '../core/ui/theme/light_theme.dart';
import '../l10n/delegates/product_catalog_localizations.dart';
import '../layers/presentation/catalog_screen.dart';

class ProductCatalogApp extends StatelessWidget {
  const ProductCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

        final mobileSize = orientation == Orientation.portrait
            ? const Size(375, 812)
            : const Size(812, 375);

        final tabletSize = orientation == Orientation.portrait
            ? const Size(800, 1280)
            : const Size(1280, 800);

        return ScreenUtilInit(
          designSize: isTablet ? tabletSize : mobileSize,
          minTextAdapt: true,
          builder: (context, child) => MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            supportedLocales: ProductCatalogLocalizations.supportedLocales,
            localizationsDelegates: const {...ProductCatalogLocalizations.localizationsDelegates},
            home: const CatalogScreen(),
          ),
        );
      },
    );
  }
}
