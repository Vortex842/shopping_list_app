import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'on_change_states/on_change.barrel.dart';

final multiSelectedModeProvider = StateProvider<bool>((ref) {
  final onMultiSelect = ref.watch(onMultiSelectProvider);
  final onAddEdit = ref.watch(onAddEditProvider);
  final onConfirm = ref.watch(onConfirmCancelProvider);

  return onMultiSelect && !onAddEdit && !onConfirm;
});
