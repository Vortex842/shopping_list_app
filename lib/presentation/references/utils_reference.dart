import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.barrel.dart';

extension ShoppingUtils on WidgetRef {
  void closeAddEditSection(WidgetRef ref) {
    read(controllerProviders).forEach((controller) => controller.text = '');
    ref.read(productsProvider.notifier).unCheckAll();
    ref.read(editableProductProvider.notifier).update((state) => null);
    read(onAddEditProvider.notifier).update((state) => false);
  }
}
