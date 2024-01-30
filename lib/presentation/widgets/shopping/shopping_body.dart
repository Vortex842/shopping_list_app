import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.barrel.dart';
import '../../references/references.barrel.dart';
import 'button_product/shopping_button.dart';

class ShoppingBody extends ConsumerStatefulWidget {
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
    final products = ref.watch(productsProvider);

    return Container(
      width: double.infinity,
      decoration: ref.bodyDecoration(isDark),
      child: ClipRRect(
        borderRadius: ref.cardRadius,
        child: SingleChildScrollView(
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
