import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/data/domain/entities/product.dart';

import 'providers.barrel.dart';

final StateProvider<Product?> newProductProvider =
    StateProvider<Product?>((ref) {
  final name = ref.watch(nameControllerProvider);
  final amount = ref.watch(amountControllerProvider);
  final price = ref.watch(priceControllerProvider);
  final isEmptyFields = ref.watch(isEmptyFieldsProvider);

  return isEmptyFields
      ? null
      : Product(
          id: '',
          name: name.text,
          amount: int.parse(amount.text),
          price: price.text.isEmpty ? 0 : double.parse(price.text),
        );
});
