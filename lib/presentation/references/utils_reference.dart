import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/domain/entities/product.dart';
import '../providers/providers.barrel.dart';

extension ShoppingUtils on WidgetRef {
  void closeAddEditSection() {
    read(controllerProviders).forEach((controller) => controller.clear());
    read(productsProvider.notifier).uncheckAll();
    read(editableProductProvider.notifier).update((state) => null);
    read(onAddEditProvider.notifier).update((state) => false);
  }

  void activeEditableProduct(Product product) {
    read(onAddEditProvider.notifier).update((state) => true);
    read(editableProductProvider.notifier).update((editProduct) {
      return product;
    });
  }

  void whenConfirmCancel() {
    read(onProductDeleteProvider.notifier).update(
      (state) => false,
    );
    read(productsProvider.notifier).uncheckAll();
  }
}
