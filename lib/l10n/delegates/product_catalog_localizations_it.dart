// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'product_catalog_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class ProductCatalogLocalizationsIt extends ProductCatalogLocalizations {
  ProductCatalogLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get catalogTitle => 'Esplora i prodotti';

  @override
  String get filterChipLabel => 'Filtri';

  @override
  String get orderChipLabel => 'Ordina';

  @override
  String get priceRange => 'Fascia di prezzo';

  @override
  String get minimum => 'Minimo';

  @override
  String get maximum => 'Massimo';

  @override
  String get deleteEverything => 'Cancella tutto';

  @override
  String get showResults => 'Mostra risultati';

  @override
  String get increasingPrice => 'Prezzo crescente';

  @override
  String get decreasingPrice => 'Prezzo decrescente';

  @override
  String get aToZName => 'Nome A-Z';

  @override
  String get zToAName => 'Nome Z-A';

  @override
  String priceOr(Object price) {
    return '$price€ or';
  }

  @override
  String installments(Object amount) {
    return '3 installments of €$amount';
  }

  @override
  String get emptyState =>
      'Cerca un nuovo prodotto o aggiusta i parametri di ricerca.';
}
