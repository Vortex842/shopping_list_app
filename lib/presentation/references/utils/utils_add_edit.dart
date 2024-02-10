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
      if (nameController.isEmpty) {
        log("Debe ingresar un nombre");
      }

      if (amountController.isEmpty) {
        log("Debe ingresar una cantidad");
      }

      if (priceController.isEmpty) {
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
      name: nameController,
      amount: int.parse(amountController),
      price: double.parse(priceController),
    );

    if (editableID != null) {
      read(productsProvider.notifier).editProductById(product);
    } else {
      read(productsProvider.notifier).addProduct(product);
    }
  }
}
