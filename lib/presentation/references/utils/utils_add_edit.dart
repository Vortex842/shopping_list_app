import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';
import 'package:uuid/uuid.dart';

import '../../../data/domain/entities/product.dart';
import '../../providers/on_done_provider.dart';
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

  bool checkEmptyTextFields() {
    read(onDoneProvider.notifier).update((onDone) => true);

    return read(controllerProviders).any(
      (providerText) {
        return read(providerText).isEmpty;
      },
    );
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
