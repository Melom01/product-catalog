import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:product_catalog/core/ui/widgets/filter/catalog_filter_chip.dart';

void main() {
  testWidgets('CatalogFilterChip renders icon, label and reacts to tap', (
    WidgetTester tester,
  ) async {
    const testLabel = 'Filter';
    const testIconPath = 'assets/icons/filter.svg';
    var wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, __) => Scaffold(
            body: CatalogFilterChip(
              iconPath: testIconPath,
              label: testLabel,
              onPressed: () => wasPressed = true,
            ),
          ),
        ),
      ),
    );

    // Verify that label and icon are present
    expect(find.text(testLabel), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);

    // Tap the filter chip
    await tester.tap(find.byType(CatalogFilterChip));
    await tester.pumpAndSettle();

    // Verify callback is called
    expect(wasPressed, isTrue);
  });
}
