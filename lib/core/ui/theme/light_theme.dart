import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';
import 'app_colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: AppConstants.appFont,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.accent,
    selectionHandleColor: AppColors.accent,
    selectionColor: AppColors.accent.withValues(alpha: 0.25),
  ),
);
