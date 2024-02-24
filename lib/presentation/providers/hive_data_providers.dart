import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/data/hive_db/implementation/db_products.dart';
import 'package:shopping_list_app/data/hive_db/implementation/db_settings.dart';

final dbProductsMainProvider = Provider<ProductsDB>((ref) {
  return ProductsDB(nameTable: 'products');
});

final dbProductsCartProvider = Provider<ProductsDB>((ref) {
  return ProductsDB(nameTable: 'cart');
});

final dbSettingsProvider = Provider<SettingsDB>((ref) {
  return SettingsDB();
});
