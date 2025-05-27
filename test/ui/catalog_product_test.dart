import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:product_catalog/core/ui/widgets/catalog/catalog_product.dart';
import 'package:product_catalog/l10n/delegates/product_catalog_localizations.dart';

void main() {
  testWidgets('CatalogProduct shows correct info', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => const MaterialApp(
          supportedLocales: ProductCatalogLocalizations.supportedLocales,
          localizationsDelegates: [
            ...ProductCatalogLocalizations.localizationsDelegates,
          ],
          home: Scaffold(
            body: CatalogProduct(
              imageUrl: 'https://fakeurl.com/image.jpg',
              title: 'Nike Air',
              merchant: 'FootLocker',
              price: '90',
              installmentPrice: '30',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Nike Air'), findsOneWidget);
    expect(find.text('FootLocker'), findsOneWidget);
    expect(find.text('90€ or'), findsOneWidget);
    expect(find.text('3 installments of €30'), findsOneWidget);
  });
}
