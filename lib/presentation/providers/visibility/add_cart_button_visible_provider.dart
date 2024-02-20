import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../on_change_states/on_side_menu_active_provider.dart';
import '../product/product_list_provider.dart';

final addCartButtonVisibleProvider = StateProvider<bool>((ref) {
  final productsOnCart = ref.watch(productsCartProvider);
  final onSideMenuActive = ref.watch(onSideMenuActiveProvider);

  return productsOnCart.isNotEmpty && !onSideMenuActive;
});
