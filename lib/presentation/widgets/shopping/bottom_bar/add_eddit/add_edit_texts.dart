import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../providers/dark_mode_provider.dart';
import '../../shopping_text_editable.dart';
import '/presentation/references/color_reference.dart';

class ProductTextSection extends ConsumerWidget {
  const ProductTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Wrap(
      spacing: 10,
      children: [
        Icon(
          LucideIcons.tag,
          color: ref.foregroundColor(isDark),
        ),
        const ProductEditableText(),
      ],
    );
  }
}

class AmountTextSection extends ConsumerWidget {
  const AmountTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Wrap(
      spacing: 10,
      children: [
        Icon(
          LucideIcons.hash,
          color: ref.foregroundColor(isDark),
        ),
        const AmountEditableText(),
      ],
    );
  }
}

class PriceTextSection extends ConsumerWidget {
  const PriceTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Wrap(
      spacing: 10,
      children: [
        Icon(
          LucideIcons.dollarSign,
          color: ref.foregroundColor(isDark),
        ),
        const PriceEditableText(),
      ],
    );
  }
}
