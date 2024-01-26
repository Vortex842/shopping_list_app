import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/dark_mode_provider.dart';
import 'color_reference.dart';

enum _ShoppingSizeText {
  title(25),
  product(18),
  price(12),
  amount(16),
  normal(12);

  final double size;

  const _ShoppingSizeText(this.size);
}

extension ShoppingText on WidgetRef {
  TextStyle _textStyle(_ShoppingSizeText text) {
    final isDark = read(isDarkMode);

    return TextStyle(
      fontSize: text.size,
      fontWeight: text == _ShoppingSizeText.product
          ? FontWeight.bold
          : FontWeight.normal,
      color: foregroundColor(isDark),
    );
  }

  TextStyle titleText() => _textStyle(_ShoppingSizeText.title);
  TextStyle productText() => _textStyle(_ShoppingSizeText.product);
  TextStyle priceText() => _textStyle(_ShoppingSizeText.price);
  TextStyle amountText() => _textStyle(_ShoppingSizeText.amount);
  TextStyle normalText() => _textStyle(_ShoppingSizeText.normal);
}
