import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/data/classes/product_class/hive_data.dart';

final DBProductsMainProvider = Provider<DBProducts>((ref) {
  return DBProducts(nameTable: 'products');
});

final DBProductsCartProvider = Provider<DBProducts>((ref) {
  return DBProducts(nameTable: 'cart');
});
