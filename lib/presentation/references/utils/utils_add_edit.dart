import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';
import 'package:shopping_list_app/presentation/providers/is_empty_textfields_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../data/domain/entities/product.dart';
import '../../providers/providers.barrel.dart';

extension ShoppingUtilsAddEdit on WidgetRef {
  bool isEmptyController(EditableTextType textType) {
    switch (textType) {
      case EditableTextType.name:
        return read(nameControllerProvider).isEmpty;
      case EditableTextType.amount:
        return read(amountControllerProvider).isEmpty;
      case EditableTextType.price:
        return read(priceControllerProvider).isEmpty;
    }
  }

  bool checkNonEmptyTextFields() {
    final nameController = read(nameControllerProvider);
    final amountController = read(amountControllerProvider);
    final priceController = read(priceControllerProvider);

    read(onDoneProvider.notifier).update((onDone) => true);

    if (nameController.isEmpty) {
      log("Debe ingresar un nombre");
      return false;
    }

    if (amountController.isEmpty) {
      log("Debe ingresar una cantidad");
      return false;
    }

    if (priceController.isEmpty) {
      log("Debe ingresar un precio");
      return false;
    }

    return true;
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
