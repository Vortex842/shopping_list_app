import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../providers/dark_mode_provider.dart';
import '../../shopping_text_editable.dart';
import '/presentation/references/color_reference.dart';

class _TextSection extends ConsumerWidget {
  final IconData icon;
  final Widget editableText;

  const _TextSection({
    required this.icon,
    required this.editableText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(
          icon,
          color: ref.foregroundColor(isDark),
        ),
        editableText,
      ],
    );
  }
}

class NameTextSection extends ConsumerWidget {
  const NameTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Row(
      children: [
        Icon(
          LucideIcons.tag,
          color: ref.foregroundColor(isDark),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: NameEditableText(),
          ),
        ),
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
    return const _TextSection(
      icon: LucideIcons.hash,
      editableText: AmountEditableText(),
    );
  }
}

class PriceTextSection extends ConsumerWidget {
  const PriceTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _TextSection(
      icon: LucideIcons.dollarSign,
      editableText: PriceEditableText(),
    );
  }
}
