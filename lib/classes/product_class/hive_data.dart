import 'package:hive/hive.dart';

import 'product.dart';

class HiveData {
  final String nameTable;

  HiveData({required this.nameTable});

  Future<List<Product>> get products async {
    final box = await Hive.openBox<Product>(nameTable);
    return box.values.toList();
  }

  Future<void> saveProduct(Product product) async {
    final box = await Hive.openBox<Product>(nameTable);
    box.put(product.id, product);
    closeDB();
  }

  Future<void> saveAlLProducts(List<Product> products) async {
    final box = await Hive.openBox<Product>(nameTable);

    for (var p in products) {
      box.put(p.id, p);
    }

    closeDB();
  }

  Future<void> saveAllChecked(List<Product> products) async {
    saveAlLProducts(products.where((p) => p.isChecked).toList());
  }

  Future<void> deleteProduct(String id) async {
    final box = await Hive.openBox<Product>(nameTable);
    box.delete(id);
    closeDB();
  }

  Future<void> clearAllChecked(List<Product> products) async {
    final box = await Hive.openBox<Product>(nameTable);

    box.deleteAll(products.where((p) => p.isChecked).map((p) => p.id));

    closeDB();
  }

  Future<void> clearAll() async {
    final box = await Hive.openBox<Product>(nameTable);

    box.clear();
  }

  static closeDB() => Hive.close();
}
