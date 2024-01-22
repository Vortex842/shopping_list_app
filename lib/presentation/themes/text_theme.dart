import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'color_theme.dart';

enum _ShoppingSizeText {
  title(25),
<<<<<<< HEAD
  product(18),
  price(12),
  amount(16),
=======
  product(20),
  price(12),
  amount(18),
>>>>>>> e8279cdc1b63e0c87678105a9e5e3c50ebeb8ecc
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
