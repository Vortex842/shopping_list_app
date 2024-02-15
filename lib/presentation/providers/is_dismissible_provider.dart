import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'on_change_states/on_change.barrel.dart';

final isDismissibleProvider = StateProvider<bool>((ref) {
  final onMultiSelect = ref.watch(onMultiSelectProvider);
  final onAddEdit = ref.watch(onAddEditProvider);

  return !(onMultiSelect || onAddEdit);
});
