import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/domain/entities/product.dart';

final productsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier(); // Se devuelde la creacion de la instancia de "TodosNotifier"
});

final onMultiSelectProvider = StateProvider<bool>((ref) {
  final products = ref.watch(productsProvider);

  return products.any((p) => p.isChecked);
});

// final filteredProducts = StateProvider<List<Product>>((ref) {
//   final products = ref.watch(productsProvider);

//   return products;
// });

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super(List.empty());
  // : super(
  //     List.generate(
  //       15,
  //       (index) => Product(
  //         id: const Uuid().v4(),
  //         name: "Producto ${index + 1}",
  //         price: index * 10.33,
  //         amount: index,
  //       ),
  //     ),
  //   );

  void addProduct(Product product) {
    state = [...state, product];
  }

  void deleteProduct(String id) {
    state = [...state..removeWhere((p) => p.id == id)];
  }

  void deleteProductsSelected() {
    state = [...state..removeWhere((p) => p.isChecked)];
  }

  void editProductById(Product product) {
    state = [
      ...state.map((p) => p.id == product.id
          ? p.copyWith(
              name: product.name,
              amount: product.amount,
              price: product.price,
            )
          : p),
    ];
  }

  Product? findById(String id) {
    return state.where((p) => p.id == id).first;
  }

  void toggleCheck(String id) {
    state = [
      ...state.map((p) => p.id == id ? p.copyWith(isChecked: !p.isChecked) : p),
    ];
  }

  void checkAll() {
    state = [
      ...state.map((p) => p.copyWith(isChecked: true)),
    ];
  }

  void uncheckAll() {
    state = [
      ...state.map((p) => p.isChecked ? p.copyWith(isChecked: false) : p),
    ];
  }
}
