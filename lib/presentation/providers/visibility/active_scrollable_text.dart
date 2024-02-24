import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';

final activeScrollableTextProvider = StateProvider<bool>((ref) {
  final onAddEdit = ref.watch(onAddEditProvider);
  final onMultiSelect = ref.watch(multiSelectVisibleProvider);
  final onSideMenuShown = ref.watch(sideMenuShownProvider);

  return !(onAddEdit || onMultiSelect || onSideMenuShown);
});
