import 'package:flutter/material.dart';

import 'app/product_catalog_app.dart';
import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerDependencies();

  runApp(const ProductCatalogApp());
}
