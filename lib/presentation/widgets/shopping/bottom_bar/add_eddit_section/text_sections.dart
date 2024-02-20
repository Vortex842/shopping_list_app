import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '/presentation/references/color_reference.dart';
import '../../shopping_text_editable.dart';

class _TextSection extends ConsumerWidget {
  final bool isExpanded;
  final IconData icon;
  final Widget editableText;

  const _TextSection({
    required this.isExpanded,
    required this.icon,
    required this.editableText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Icon(
          icon,
          color: ref.foregroundColor(),
        ),
        Expanded(
          flex: isExpanded ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: editableText,
          ),
        ),
      ],
    );
  }
}

class NameTextSection extends ConsumerWidget {
  const NameTextSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const _TextSection(
      isExpanded: true,
      icon: LucideIcons.tag,
      editableText: NameEditableText(),
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
      isExpanded: false,
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
      isExpanded: false,
      icon: LucideIcons.dollarSign,
      editableText: PriceEditableText(),
    );
  }
}
