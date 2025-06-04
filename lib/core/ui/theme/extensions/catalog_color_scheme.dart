part of 'theme_config.dart';

extension CatalogColorScheme on ColorScheme {
  Color? get catalogAccent => primary[500];

  Color? get catalogBorder => brightness == Brightness.light ? gray[200] : gray[700];

  Color? get catalogDivider => brightness == Brightness.light ? gray[400] : gray[800];

  Color? get catalogError => brightness == Brightness.light ? error[500] : error[300];

  Color? get catalogFilterBackground => brightness == Brightness.light ? gray[300] : gray[850];

  Color? get catalogHeader => brightness == Brightness.light ? gray[950] : gray[100];

  Color? get catalogIcon => brightness == Brightness.light ? gray[950] : gray[100];

  Color? get catalogPrimaryBackground => brightness == Brightness.light ? gray[100] : gray[900];

  Color? get catalogPrimaryText => brightness == Brightness.light ? gray[900] : gray[200];

  Color? get catalogSecondaryBackground => brightness == Brightness.light ? gray[800] : gray[200];

  Color? get catalogSecondaryText => brightness == Brightness.light ? gray[700] : gray[600];

  Color? get catalogShimmer => brightness == Brightness.light ? gray[500] : gray[850];

  Color? get catalogUnselectedOption => primary[300];

  Color? get white => gray[100];
}
