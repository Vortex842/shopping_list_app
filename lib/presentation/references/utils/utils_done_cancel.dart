import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.barrel.dart';
import 'utils_add_edit.dart';
import 'utils_reference.dart';

extension ShoppingUtilsDoneCancel on WidgetRef {
  void closeAddEditSection() {
    read(productsProvider.notifier).uncheckAll();
    read(editableProductProviderID.notifier).update((state) => null);
    read(onAddEditProvider.notifier).update((state) => false);
  }

  void toDoneProduct() {
    if (!checkEmptyTextFields()) {
      toAddEdit();

      scrollToFinal();

      closeAddEditSection();
    }
  }
}
