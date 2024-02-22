import 'package:hive/hive.dart';

import 'product.dart';

class HiveData {
  static Future<List<Product>> get products async {
    final box = await Hive.openBox<Product>('products');
    return box.values.toList();
  }

  static Future<void> saveProduct(Product product) async {
    final box = await Hive.openBox<Product>('products');
    box.put(product.id, product);
    closeDB();
  }

  static Future<void> saveAlLProducts(List<Product> products) async {
    final box = await Hive.openBox<Product>('products');

    for (var p in products) {
      box.put(p.id, p);
    }

    closeDB();
  }

  static Future<void> saveAllChecked(List<Product> products) async {
    saveAlLProducts(products.where((p) => p.isChecked).toList());
  }

  static Future<void> deleteProduct(String id) async {
    final box = await Hive.openBox<Product>('products');
    box.delete(id);
    closeDB();
  }

  static Future<void> clearAllChecked(List<Product> products) async {
    final box = await Hive.openBox<Product>('products');

    box.deleteAll(products.where((p) => p.isChecked).map((p) => p.id));

    closeDB();
  }

  static Future<void> clearAll() async {
    final box = await Hive.openBox<Product>('products');

    box.clear();
  }

  static closeDB() => Hive.close();
}
