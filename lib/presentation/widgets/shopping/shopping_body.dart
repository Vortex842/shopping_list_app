import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/providers.barrel.dart';
import '../../references/references.barrel.dart';
import 'button_product/shopping_button.dart';

class ShoppingBody extends StatefulHookConsumerWidget {
  const ShoppingBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoppingBodyState();
}

class _ShoppingBodyState extends ConsumerState<ShoppingBody>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // print("build - shopping body");
    super.build(context);
    final isDark = ref.watch(isDarkProvider);
    final multiSelectedMode = ref.watch(multiSelectedModeProvider);

    return Container(
      width: double.infinity,
      decoration: ref.bodyDecoration(isDark),
      child: Column(
        children: [
          const Expanded(
            child: ShoppingProductsSection(),
          ),
          if (multiSelectedMode) const TotalCostSection(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TotalCostSection extends ConsumerWidget {
  const TotalCostSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(totalCostProvider);

    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          "Total: \$$total",
          style: ref.totalText(),
        ),
      ),
    );
  }
}

class ShoppingProductsSection extends ConsumerWidget {
  const ShoppingProductsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final scrollController = ref.watch(scrollControllerProvider);

    return ClipRRect(
      borderRadius: ref.cardRadius,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            children: List.generate(
              products.length,
              (index) => ShoppingButton(
                key: Key(products[index].hashCode.toString()),
                product: products[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
