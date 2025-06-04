import 'package:flutter/material.dart';

import '../app_colors.dart';

part 'catalog_color_scheme.dart';

extension ThemeConfig on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
