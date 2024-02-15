import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/product/product_list_provider.dart';

final totalCostProvider = StateProvider<double>((ref) {
  ref.watch(productsProvider);

  return ref.watch(productsProvider.notifier).getTotalCost();
});
