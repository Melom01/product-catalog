import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:product_catalog/core/ui/widgets/filter/catalog_filter_bottom_sheet.dart';

void main() {
  testWidgets(
    'CatalogFilterBottomSheet renders title, content and close button',
    (WidgetTester tester) async {
      const testTitle = 'Filter Options';
      const testContentKey = Key('testContent');
      var closePressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, _) => Builder(
              builder: (context) {
                return Scaffold(
                  body: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        CatalogFilterBottomSheet.show(
                          context: context,
                          title: testTitle,
                          child: const SizedBox(key: testContentKey),
                          onClose: () => closePressed = true,
                        );
                      },
                      child: const Text('Open Sheet'),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Open the bottom sheet
      await tester.tap(find.text('Open Sheet'));
      await tester.pumpAndSettle();

      // Verify title is rendered
      expect(find.text(testTitle), findsOneWidget);

      // Verify content is rendered
      expect(find.byKey(testContentKey), findsOneWidget);

      // Tap close button
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      // Verify close callback is called
      expect(closePressed, isTrue);
    },
  );
}
