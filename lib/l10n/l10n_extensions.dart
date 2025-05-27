import 'package:flutter/material.dart';

import 'delegates/product_catalog_localizations.dart';

extension ProductCatalogLocalizationsExtensions on BuildContext {
  ProductCatalogLocalizations get l10n => ProductCatalogLocalizations.of(this);
}
