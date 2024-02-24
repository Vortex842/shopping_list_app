import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/visibility/active_scrollable_text.dart';
import 'package:text_scroll/text_scroll.dart';

class ScrollableText extends ConsumerWidget {
  final String text;
  final TextStyle style;

  const ScrollableText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeScrollableText = ref.watch(activeScrollableTextProvider);

    return activeScrollableText
        ? TextScroll(
            text,
            pauseBetween: const Duration(milliseconds: 5000),
            pauseOnBounce: const Duration(milliseconds: 1000),
            velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
            mode: TextScrollMode.bouncing,
            fadeBorderSide: FadeBorderSide.both,
            fadedBorder: true,
            fadedBorderWidth: 0.01,
            style: style,
          )
        : Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: style,
          );
  }
}
