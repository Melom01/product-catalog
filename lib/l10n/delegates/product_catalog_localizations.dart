import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'product_catalog_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ProductCatalogLocalizations
/// returned by `ProductCatalogLocalizations.of(context)`.
///
/// Applications need to include `ProductCatalogLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'delegates/product_catalog_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ProductCatalogLocalizations.localizationsDelegates,
///   supportedLocales: ProductCatalogLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ProductCatalogLocalizations.supportedLocales
/// property.
abstract class ProductCatalogLocalizations {
  ProductCatalogLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ProductCatalogLocalizations of(BuildContext context) {
    return Localizations.of<ProductCatalogLocalizations>(
      context,
      ProductCatalogLocalizations,
    )!;
  }

  static const LocalizationsDelegate<ProductCatalogLocalizations> delegate =
      _ProductCatalogLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('it')];

  /// No description provided for @catalogTitle.
  ///
  /// In it, this message translates to:
  /// **'Esplora i prodotti'**
  String get catalogTitle;

  /// No description provided for @filterChipLabel.
  ///
  /// In it, this message translates to:
  /// **'Filtri'**
  String get filterChipLabel;

  /// No description provided for @orderChipLabel.
  ///
  /// In it, this message translates to:
  /// **'Ordina'**
  String get orderChipLabel;

  /// No description provided for @priceRange.
  ///
  /// In it, this message translates to:
  /// **'Fascia di prezzo'**
  String get priceRange;

  /// No description provided for @minimum.
  ///
  /// In it, this message translates to:
  /// **'Minimo'**
  String get minimum;

  /// No description provided for @maximum.
  ///
  /// In it, this message translates to:
  /// **'Massimo'**
  String get maximum;

  /// No description provided for @deleteEverything.
  ///
  /// In it, this message translates to:
  /// **'Cancella tutto'**
  String get deleteEverything;

  /// No description provided for @showResults.
  ///
  /// In it, this message translates to:
  /// **'Mostra risultati'**
  String get showResults;

  /// No description provided for @increasingPrice.
  ///
  /// In it, this message translates to:
  /// **'Prezzo crescente'**
  String get increasingPrice;

  /// No description provided for @decreasingPrice.
  ///
  /// In it, this message translates to:
  /// **'Prezzo decrescente'**
  String get decreasingPrice;

  /// No description provided for @aToZName.
  ///
  /// In it, this message translates to:
  /// **'Nome A-Z'**
  String get aToZName;

  /// No description provided for @zToAName.
  ///
  /// In it, this message translates to:
  /// **'Nome Z-A'**
  String get zToAName;

  /// No description provided for @priceOr.
  ///
  /// In it, this message translates to:
  /// **'{price}€ or'**
  String priceOr(Object price);

  /// Installment payment with dynamic amount
  ///
  /// In it, this message translates to:
  /// **'3 installments of €{amount}'**
  String installments(Object amount);

  /// No description provided for @emptyState.
  ///
  /// In it, this message translates to:
  /// **'Cerca un nuovo prodotto o aggiusta i parametri di ricerca.'**
  String get emptyState;
}

class _ProductCatalogLocalizationsDelegate
    extends LocalizationsDelegate<ProductCatalogLocalizations> {
  const _ProductCatalogLocalizationsDelegate();

  @override
  Future<ProductCatalogLocalizations> load(Locale locale) {
    return SynchronousFuture<ProductCatalogLocalizations>(
      lookupProductCatalogLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['it'].contains(locale.languageCode);

  @override
  bool shouldReload(_ProductCatalogLocalizationsDelegate old) => false;
}

ProductCatalogLocalizations lookupProductCatalogLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'it':
      return ProductCatalogLocalizationsIt();
  }

  throw FlutterError(
    'ProductCatalogLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
