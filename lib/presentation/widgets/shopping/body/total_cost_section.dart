import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/references/references.barrel.dart';

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
