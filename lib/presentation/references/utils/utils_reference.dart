import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/domain/entities/product.dart';
import '../../enums/editable_text_type.dart';
import '../../providers/providers.barrel.dart';

extension ShoppingUtils on WidgetRef {
  void activeEditableProduct(Product product) {
    read(onAddEditProvider.notifier).update((state) => true);

    read(nameControllerProvider.notifier).update((state) => product.name);
    read(amountControllerProvider.notifier)
        .update((state) => product.amount.toString());
    read(priceControllerProvider.notifier)
        .update((state) => product.price.toString());

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

  void scrollToFinal() {
    final scrollController = read(scrollControllerProvider);

    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
    );
  }

  String errorText(EditableTextType textType) {
    return textType.returnType(
      'Ingresa el nombre del producto',
      'Ingresa una cantidad valida',
      'Ingresa un precio valido',
    );
  }
}

extension ShoppingFunctions on WidgetRef {}
