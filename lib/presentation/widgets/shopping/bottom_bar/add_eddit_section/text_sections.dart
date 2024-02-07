import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../shopping_text_editable.dart';
import '/presentation/references/color_reference.dart';

class NameTextSection extends ConsumerStatefulWidget {
  const NameTextSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NameTextSectionState();
}

class _NameTextSectionState extends ConsumerState<NameTextSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          LucideIcons.tag,
          color: ref.foregroundColor(),
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
    return Row(
      children: [
        Icon(
          LucideIcons.hash,
          color: ref.foregroundColor(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: AmountEditableText(),
        )
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
    return Row(
      children: [
        Icon(
          LucideIcons.dollarSign,
          color: ref.foregroundColor(),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: PriceEditableText(),
        ),
      ],
    );
  }
}
