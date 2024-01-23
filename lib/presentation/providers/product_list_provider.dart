import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/domain/entities/product.dart';

final productsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier(); // Se devuelde la creacion de la instancia de "TodosNotifier"
});

// final filteredProducts = StateProvider<List<Product>>((ref) {
//   final products = ref.watch(productsProvider);

//   return products;
// });

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier()
      : super(
          [
            Product(
                id: const Uuid().v4(), name: "Fideos", price: 856, amount: 12),
            Product(
                id: const Uuid().v4(), name: "Arroz", price: 2366, amount: 2),
            Product(
                id: const Uuid().v4(), name: "Atun", price: 85136, amount: 8),
            Product(
                id: const Uuid().v4(),
                name: "Carne 1kg",
                price: 7899,
                amount: 12),
            Product(
                id: const Uuid().v4(), name: "Manteca", price: 856, amount: 5),
            Product(
                id: const Uuid().v4(), name: "Arroz", price: 5151, amount: 0),
            Product(id: const Uuid().v4(), name: "Atun", price: 856, amount: 2),
            Product(
                id: const Uuid().v4(),
                name: "Carne 1kg",
                price: 1472,
                amount: 12),
            Product(
                id: const Uuid().v4(),
                name: "Manteca",
                price: 25893,
                amount: 0),
            Product(
                id: const Uuid().v4(), name: "Azucar", price: 856, amount: 1),
            Product(
                id: const Uuid().v4(),
                name: "Carne 1kg",
                price: 2023610,
                amount: 12),
            Product(
                id: const Uuid().v4(),
                name: "Manteca",
                price: 800236,
                amount: 6),
            Product(
                id: const Uuid().v4(), name: "Azucar", price: 856, amount: 1),
          ],
        );

  void addProduct(Product product) {
    state = [...state, product];
  }

  void deleteProduct(String id) {
    state = [...state..where((p) => p.id != id)];
  }

  void toggleCheck(String id) {
    state = [
      ...state.map((p) => p.id == id ? p.copyWith(isChecked: !p.isChecked) : p),
    ];
  }
}
