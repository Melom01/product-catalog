import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

import 'package:product_catalog/core/ui/theme/app_colors.dart';
import 'package:product_catalog/core/ui/widgets/catalog/catalog_product_skeleton.dart';

void main() {
  testWidgets('CatalogProductSkeleton renders shimmer placeholders', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (_, _) => const Scaffold(body: CatalogProductSkeleton()),
        ),
      ),
    );

    // Check the Shimmer wrapper exists
    expect(find.byType(Shimmer), findsOneWidget);

    // Check that there are Containers that simulate skeleton elements
    final containerWidgets = find.byWidgetPredicate(
      (widget) => widget is Container && widget.decoration != null,
    );
    expect(containerWidgets, findsWidgets);

    // Check that placeholder containers have the correct color
    final coloredContainers = find.byWidgetPredicate(
      (widget) => widget is Container && widget.color == AppColors.gray100,
    );
    expect(coloredContainers, findsWidgets);
  });
}
