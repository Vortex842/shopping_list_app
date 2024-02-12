import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.barrel.dart';

final multiSelectedModeProvider = StateProvider<bool>((ref) {
  final onMultiSelect = ref.watch(onMultiSelectProvider);
  final onAddEdit = ref.watch(onAddEditProvider);
  final onProductDelete = ref.watch(onProductDeleteProvider);

  return onMultiSelect && !onAddEdit && !onProductDelete;
});
