import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../data/domain/entities/product.dart';
import '../../providers/providers.barrel.dart';

extension ShoppingUtilsAddEdit on WidgetRef {
  void checkNonEmptyTextFields() {
    final nameController = read(nameControllerProvider);
    final amountController = read(amountControllerProvider);
    final priceController = read(priceControllerProvider);

    final canDone = read(canDoneProvider);

    if (!canDone) {
      if (nameController.text.isEmpty) {
        log("Debe ingresar un nombre");
      }

      if (amountController.text.isEmpty) {
        log("Debe ingresar una cantidad");
      }

      if (priceController.text.isEmpty) {
        log("Debe ingresar un precio");
      }
      return;
    }
  }

  void toAddEdit() {
    final nameController = read(nameControllerProvider);
    final amountController = read(amountControllerProvider);
    final priceController = read(priceControllerProvider);
    final editableID = read(editableProductProviderID);

    final product = Product(
      id: editableID ?? const Uuid().v4(),
      name: nameController.text,
      amount: int.parse(amountController.text),
      price: double.parse(priceController.text),
    );

    if (editableID != null) {
      read(productsProvider.notifier).editProductById(product);
    } else {
      read(productsProvider.notifier).addProduct(product);
    }
  }
}
