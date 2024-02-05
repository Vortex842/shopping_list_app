import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../../data/domain/entities/product.dart';
import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';

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
                  TextScrollName(
                    nameProduct: widget.product.name,
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

class TextScrollName extends ConsumerWidget {
  final String nameProduct;

  const TextScrollName({
    super.key,
    required this.nameProduct,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextScroll(
      nameProduct,
      // "Texto super ultramega hyper largo",
      pauseBetween: const Duration(milliseconds: 1000),
      pauseOnBounce: const Duration(milliseconds: 500),
      velocity: const Velocity(pixelsPerSecond: Offset(25, 0)),
      // pauseOnBounce: const Duration(milliseconds: 1000),
      mode: TextScrollMode.bouncing,
      fadeBorderSide: FadeBorderSide.both,
      fadedBorder: true,
      fadedBorderWidth: 0.02,
      style: ref.nameText(),
    );
  }
}
