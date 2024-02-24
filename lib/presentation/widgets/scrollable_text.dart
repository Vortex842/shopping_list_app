import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
