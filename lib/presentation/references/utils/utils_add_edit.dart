import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/editable_text_type.dart';
import 'package:uuid/uuid.dart';

import '/classes/product_class/product.dart';
import '/presentation/providers/providers.barrel.dart';

extension ShoppingUtilsAddEdit on WidgetRef {
  bool isFailController(EditableTextType textType) {
    final name = read(nameControllerProvider);
    final amount = read(amountControllerProvider);
    final price = read(priceControllerProvider);

    return textType.returnType(
      name.isEmpty,
      amount.isEmpty || (int.parse(amount) < 0),
      price.isEmpty || (double.parse(price) < 0),
    );
  }

  bool checkEmptyTextFields() {
    read(onDoneProvider.notifier).update((onDone) => true);

    return EditableTextType.values.any((type) => isFailController(type));
  }

  void toAddEdit() async {
    final hiveDataMain = read(hiveDataMainProvider);

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

    await hiveDataMain.saveProduct(product);
  }
}
