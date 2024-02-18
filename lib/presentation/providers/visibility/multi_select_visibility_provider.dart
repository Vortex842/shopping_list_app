import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/on_change_states/on_add_edit_provider.dart';

import '../on_change_states/on_change.barrel.dart';

final multiSelectVisibilityProvider = StateProvider<bool>((ref) {
  final onMultiSelect = ref.watch(onMultiSelectProvider);
  final onAddEdit = ref.watch(onAddEditProvider);
  final onConfirm = ref.watch(onConfirmCancelProvider);

  return onMultiSelect && !onAddEdit && !onConfirm;
});
