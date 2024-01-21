import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'color_theme.dart';

enum _ShoppingSizeText {
  title(25),
  product(20),
  price(14),
  amount(18);

  final double size;

  const _ShoppingSizeText(this.size);
}

extension ShoppingText on WidgetRef {
  TextStyle _textStyle(_ShoppingSizeText text, bool isDark) {
    return TextStyle(
      fontSize: text.size,
      fontWeight: FontWeight.bold,
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
}