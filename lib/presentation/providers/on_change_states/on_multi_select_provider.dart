import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../product/product_list_provider.dart';

final onMultiSelectProvider = StateProvider<bool>((ref) {
  final products = ref.watch(productsProvider);

  return products.any((p) => p.isChecked);
});
