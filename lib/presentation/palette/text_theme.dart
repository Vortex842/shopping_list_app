import 'package:flutter/material.dart';

import '../palette/color_theme.dart';

enum ShoppingSizeText {
  title(25),
  product(20),
  price(12),
  amount(16);

  final double size;

  const ShoppingSizeText(this.size);
}

extension ShoppingText on BuildContext {
  TextStyle pruductText(ShoppingSizeText text) => TextStyle(
        fontSize: text.size,
        fontWeight: FontWeight.w700,
        color: foregroundColor(false),
      );
}
