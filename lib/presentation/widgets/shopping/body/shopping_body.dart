import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import 'shopping_products_section.dart';
import 'total_cost_section.dart';

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
