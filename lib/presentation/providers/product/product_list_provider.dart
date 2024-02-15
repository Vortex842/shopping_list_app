import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/domain/entities/product.dart';
import '../on_change_states/on_add_cart_provider.dart';

final productsProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});

final productsCartProvider =
    StateNotifierProvider<ProductNotifier, List<Product>>((ref) {
  return ProductNotifier();
});

final selectProductsProvider = StateProvider<List<Product>>((ref) {
  final products = ref.watch(productsProvider);
  final productsOnCart = ref.watch(productsCartProvider);
  final onAddCart = ref.watch(onAddCartProvider);

  return onAddCart ? productsOnCart : products;
});

// final filteredProducts = StateProvider<List<Product>>((ref) {
//   final products = ref.watch(productsProvider);

//   return products;
// });

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super(List.empty());
  // ProductNotifier()
  //     : super(
  //         List.generate(
  //           15,
  //           (index) => Product(
  //             id: const Uuid().v4(),
  //             name: "Producto ${index + 1}",
  //             price: index * 10.33,
  //             amount: index,
  //           ),
  //         ),
  //       );

  void addProduct(Product product) {
    state = [...state, product];
  }

  void addAll(List<Product> products) {
    final productsNoCheck = products.map(
      (p) => p.copyWith(isChecked: false),
    );

    state = [...state, ...productsNoCheck];
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

  double getTotalCost() {
    if (state.isNotEmpty) {
      return double.parse(
        state
            .map((p) => p.amount * p.price)
            .reduce((acum, actual) => acum + actual)
            .toStringAsFixed(4),
      );
    }
    return 0;
  }
}
