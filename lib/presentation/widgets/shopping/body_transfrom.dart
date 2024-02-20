import 'dart:math';

import 'package:flutter/material.dart';

class BodyTransform extends StatelessWidget {
  final double value;
  final Widget body;

  const BodyTransform({
    super.key,
    required this.value,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => Transform(
        alignment: Alignment.center,
        origin: Offset(constraints.maxWidth * (1 - 0.3 * value), 0),
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(pi * value / 5)
          ..scale(1 - (1 - 0.5) * value, 1.0),
        child: body,
      ),
    );
  }
}
