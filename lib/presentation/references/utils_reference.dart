import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/domain/entities/product.dart';
import '../providers/providers.barrel.dart';

extension ShoppingUtils on WidgetRef {
  void closeAddEditSection() {
    read(productsProvider.notifier).uncheckAll();
    read(editableProductProviderID.notifier).update((state) => null);
    read(onAddEditProvider.notifier).update((state) => false);
  }

  void activeEditableProduct(Product product) {
    read(onAddEditProvider.notifier).update((state) => true);

    read(nameControllerProvider.notifier).update(
      (state) {
        return TextEditingController(text: product.name);
      },
    );
    read(amountControllerProvider.notifier).update(
      (state) {
        return TextEditingController(text: product.amount.toString());
      },
    );
    read(priceControllerProvider.notifier).update(
      (state) {
        return TextEditingController(text: product.price.toString());
      },
    );

    read(editableProductProviderID.notifier).update((id) {
      return product.id;
    });
  }

  void whenConfirmCancel() {
    read(onProductDeleteProvider.notifier).update(
      (state) => false,
    );
    read(productsProvider.notifier).uncheckAll();
  }
}
