import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '/data/classes/product_class/product.dart';
import '/presentation/enums/editable_text_type.dart';
import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/utils/utils_reference.dart';

extension ShoppingUtilsAddEdit on WidgetRef {
  bool isFailController(EditableTextType textType) {
    final name = read(nameControllerProvider);
    final amount = read(amountControllerProvider);
    final price = read(priceControllerProvider);

    return textType.returnType(
      name.isEmpty,
      amount.isEmpty || !isNumberTextField(amount),
      price.isEmpty || !isNumberTextField(price),
    );
  }

  bool checkEmptyTextFields() {
    read(onDoneProvider.notifier).update((onDone) => true);

    return EditableTextType.values.any((type) => isFailController(type));
  }

  void toAddEdit() async {
    final dbProductsMain = read(dbProductsMainProvider);

    final nameController = read(nameControllerProvider);
    final amountController = read(amountControllerProvider);
    final priceController = read(priceControllerProvider);
    final editableID = read(editableProductProviderID);

    final newProduct = Product(
      id: editableID ?? const Uuid().v4(),
      name: nameController,
      amount: int.parse(amountController),
      price: double.parse(priceController),
    );

    if (editableID != null) {
      read(productsProvider.notifier).editProductById(newProduct);
    } else {
      read(productsProvider.notifier).addProduct(newProduct);
    }

    await dbProductsMain.saveProduct(newProduct);
  }
}
