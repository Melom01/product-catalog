import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:product_catalog/core/ui/widgets/catalog_search_bar.dart';
import '../mock/mock_search_callback.dart';

void main() {
  late MockSearchCallback mockOnSearch;
  late TextEditingController controller;

  setUp(() {
    mockOnSearch = MockSearchCallback();
    controller = TextEditingController();
  });

  testWidgets(
    'CatalogSearchBar renders and triggers onSearch when icon pressed',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (_, _) => Scaffold(
              body: CatalogSearchBar(
                controller: controller,
                onSearch: mockOnSearch.call,
              ),
            ),
          ),
        ),
      );

      // Insert some text in the search bar
      await tester.enterText(find.byType(TextField), 'shoes');
      expect(controller.text, 'shoes');

      // Tap search icon
      await tester.tap(find.byType(IconButton));
      await tester.pump();

      // Callback execution verification
      verify(() => mockOnSearch()).called(1);
    },
  );
}
