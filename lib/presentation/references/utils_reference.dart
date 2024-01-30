import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/editable_text_provider.dart';
import '../providers/on_add_edit_provider.dart';

extension ShoppingUtils on WidgetRef {
  void closeAddEditSection(WidgetRef ref) {
    read(controllerProviders).forEach((controller) => controller.text = '');

    read(onAddEditProvider.notifier).update((state) => false);
  }
}
