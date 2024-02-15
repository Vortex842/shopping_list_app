import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/product/product_list_provider.dart';

final totalCostProvider = StateProvider<double>((ref) {
  ref.watch(productsCartProvider);

  return ref.watch(productsCartProvider.notifier).getTotalCost();
});
