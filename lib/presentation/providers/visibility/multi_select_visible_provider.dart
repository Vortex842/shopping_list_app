import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../on_change_states/on_change.barrel.dart';

final multiSelectVisibleProvider = StateProvider<bool>((ref) {
  final onMultiSelect = ref.watch(onMultiSelectProvider);
  final onAddEdit = ref.watch(onAddEditProvider);
  final onConfirm = ref.watch(onConfirmCancelProvider);

  return onMultiSelect && !onAddEdit && !onConfirm;
});
