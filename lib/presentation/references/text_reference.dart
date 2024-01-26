import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  TextStyle _textStyle(_ShoppingSizeText text, bool isDark) {
    return TextStyle(
      fontSize: text.size,
      fontWeight: text == _ShoppingSizeText.product
          ? FontWeight.bold
          : FontWeight.normal,
      color: foregroundColor(isDark),
    );
  }

  TextStyle titleText(bool isDark) =>
      _textStyle(_ShoppingSizeText.title, isDark);
  TextStyle productText(bool isDark) =>
      _textStyle(_ShoppingSizeText.product, isDark);
  TextStyle priceText(bool isDark) =>
      _textStyle(_ShoppingSizeText.price, isDark);
  TextStyle amountText(bool isDark) =>
      _textStyle(_ShoppingSizeText.amount, isDark);
  TextStyle normalText(bool isDark) =>
      _textStyle(_ShoppingSizeText.normal, isDark);
}
