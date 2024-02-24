import 'package:hive/hive.dart';

import '../classes/product_class/product.dart';

class DBProducts {
  final String nameTable;

  DBProducts({required this.nameTable});

  Future<List<Product>> get products async {
    final box = await Hive.openBox<Product>(nameTable);
    return box.values.toList();
  }

  Future<void> saveProduct(Product product) async {
    final box = await Hive.openBox<Product>(nameTable);
    box.put(product.id, product);
  }

  Future<void> saveAlLProducts(List<Product> products) async {
    final box = await Hive.openBox<Product>(nameTable);

    for (var p in products) {
      box.put(p.id, p);
    }
  }

  Future<void> saveAllChecked(List<Product> products) async {
    saveAlLProducts(products.where((p) => p.isChecked).toList());
  }

  Future<void> deleteProduct(String id) async {
    final box = await Hive.openBox<Product>(nameTable);
    box.delete(id);
  }

  Future<void> clearAllProducts(List<Product> products) async {
    final box = await Hive.openBox<Product>(nameTable);

    box.deleteAll(products.where((p) => p.isChecked).map((p) => p.id));
  }

  Future<void> clearAll() async {
    final box = await Hive.openBox<Product>(nameTable);

    box.clear();
  }
}
