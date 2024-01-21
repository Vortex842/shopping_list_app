import 'package:flutter/material.dart';

import 'color_theme.dart';

enum _ShoppingSizeText {
  title(25),
  product(20),
  price(12),
  amount(16);

  final double size;

  const _ShoppingSizeText(this.size);
}

extension ShoppingText on BuildContext {
  TextStyle _textStyle(_ShoppingSizeText text, bool isDark) {
    return TextStyle(
      fontSize: text.size,
      fontWeight: FontWeight.normal,
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
