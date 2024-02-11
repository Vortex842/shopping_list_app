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
                  TextScrollName(
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

class TextScrollName extends ConsumerWidget {
  final String text;
  final TextStyle style;

  const TextScrollName({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextScroll(
      text,
      pauseBetween: const Duration(milliseconds: 5000),
      pauseOnBounce: const Duration(milliseconds: 1000),
      velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
      mode: TextScrollMode.bouncing,
      fadeBorderSide: FadeBorderSide.both,
      fadedBorder: true,
      fadedBorderWidth: 0.01,
      style: style,
    );
  }
}
