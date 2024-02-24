import '../classes/product_class/product.dart';
import 'db_hive.dart';

// class DBProducts {
//   final String nameTable;

//   DBProducts({required this.nameTable});

//   Future<List<Product>> get products async {
//     final box = await Hive.openBox<Product>(nameTable);
//     return box.values.toList();
//   }

//   Future<void> saveProduct(Product product) async {
//     final box = await Hive.openBox<Product>(nameTable);
//     box.put(product.id, product);
//   }

//   Future<void> saveAllProducts(List<Product> products) async {
//     final box = await Hive.openBox<Product>(nameTable);

//     for (var p in products) {
//       box.put(p.id, p);
//     }
//   }

//   Future<void> saveAllChecked(List<Product> products) async {
//     saveAllProducts(products.where((p) => p.isChecked).toList());
//   }

//   Future<void> deleteProduct(String id) async {
//     final box = await Hive.openBox<Product>(nameTable);
//     box.delete(id);
//   }

//   Future<void> clearAllProducts(List<Product> products) async {
//     final box = await Hive.openBox<Product>(nameTable);

//     box.deleteAll(products.where((p) => p.isChecked).map((p) => p.id));
//   }

//   Future<void> clearAll() async {
//     final box = await Hive.openBox<Product>(nameTable);

//     box.clear();
//   }
// }

class DBProducts extends DataBaseHive<Product> {
  DBProducts({required super.nameTable});

  Future<List<Product>> get products async =>
      dataMap.then((value) => value.values.toList());

  Future<void> saveProduct(Product product) async {
    save(product.id, product);
  }

  Future<void> deleteProduct(Product product) async {
    delete(product.id);
  }

  Future<void> saveAllProducts(List<Product> products) async {
    saveAll({for (var pCheck in products) pCheck.id: pCheck});
  }

  Future<void> clearAllProducts(List<Product> products) async {
    deleteAllByIDs(products.map((p) => p.id).toList());
  }
}
