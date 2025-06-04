import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

const primary500 = Color(0xFF5666F0);

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  fontFamily: AppConstants.appFont,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primary500,
    selectionHandleColor: primary500,
    selectionColor: primary500.withValues(alpha: 0.25),
  ),
);
