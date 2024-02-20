import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/on_change_states/on_change.barrel.dart';

final onTapProductProvider = StateProvider<bool>((ref) {
  final onAddEdit = ref.watch(onAddEditProvider);
  final onConfirm = ref.watch(onConfirmCancelProvider);
  final onSideMenuActive = ref.watch(onSideMenuActiveProvider);

  return !onAddEdit && !onConfirm && !onSideMenuActive;
});
