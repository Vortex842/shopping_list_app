import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/providers.barrel.dart';
import 'package:shopping_list_app/presentation/references/references.barrel.dart';
import 'package:shopping_list_app/presentation/widgets/body/shopping_products_section.dart';

class ScrollableProductBody extends ConsumerWidget {
  const ScrollableProductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onAddCart = ref.watch(onAddCartProvider);
    final total = onAddCart ? ref.watch(totalCostProvider) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text(
            !onAddCart ? "Por comprar" : "Ya comprado",
            style: ref.normalText(),
          ),
          const Expanded(
            child: ShoppingProductsSection(),
          ),
          Visibility(
            visible: onAddCart,
            child: Text(
              "Total: \$$total",
              style: ref.totalText(),
            ),
          ),
        ],
      ),
    );
  }
}
