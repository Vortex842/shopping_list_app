import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/data/hive_db/db_products.dart';

final DBProductsMainProvider = Provider<DBProducts>((ref) {
  return DBProducts(nameTable: 'products');
});

final DBProductsCartProvider = Provider<DBProducts>((ref) {
  return DBProducts(nameTable: 'cart');
});
