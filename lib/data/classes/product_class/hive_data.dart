import 'package:hive/hive.dart';

import 'product.dart';

class HiveData {
  static Future<void> saveProduct(Product product) async {
    final box = await Hive.openBox<Product>('products');
    box.put(product.id, product);
    closeDB();
  }

  static Future<void> deleteProduct(String id) async {
    final box = await Hive.openBox<Product>('products');
    box.delete(id);
    closeDB();
  }

  static Future<void> clearAll() async {
    final box = await Hive.openBox<Product>('products');
    box.clear();
    closeDB();
  }

  static Future<void> clearAllChecked(List<Product> products) async {
    final box = await Hive.openBox<Product>('products');

    box.deleteAll(products.where((p) => p.isChecked).map((p) => p.id));

    closeDB();
  }

  static closeDB() => Hive.close();

  static Future<List<Product>> get products async {
    final box = await Hive.openBox<Product>('products');
    return box.values.toList();
  }
}
