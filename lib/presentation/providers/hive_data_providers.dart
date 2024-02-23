import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/classes/product_class/hive_data.dart';

final hiveDataMainProvider = Provider<HiveData>((ref) {
  return HiveData(nameTable: 'products');
});

final hiveDataCartProvider = Provider<HiveData>((ref) {
  return HiveData(nameTable: 'cart');
});
