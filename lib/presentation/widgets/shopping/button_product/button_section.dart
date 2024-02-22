import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/classes/product_class/product.dart';
import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import '../scrollable_text.dart';

class ButtonSection extends ConsumerStatefulWidget {
  final Product product;

  const ButtonSection(this.product, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends ConsumerState<ButtonSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isDark = ref.watch(isDarkProvider);

    return DecoratedBox(
      decoration: ref.buttonSectionDecoration(isDark),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScrollableText(
                    text: widget.product.name,
                    style: ref.nameText(),
                  ),
                  Text(
                    "\$${widget.product.price.toStringAsFixed(2)}",
                    style: ref.priceText(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${widget.product.amount}",
                  style: ref.amountText(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
