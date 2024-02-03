import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'color_reference.dart';

enum _ShoppingSizeText {
  title(25),
  name(18),
  price(12),
  amount(16),
  editableText(16),
  normal(14);

  final double size;

  const _ShoppingSizeText(this.size);
}

extension ShoppingText on WidgetRef {
  TextStyle _textStyle(_ShoppingSizeText text) {
    return TextStyle(
      fontSize: text.size,
      fontWeight: text == _ShoppingSizeText.name ||
              text == _ShoppingSizeText.editableText
          ? FontWeight.bold
          : FontWeight.normal,
      color: foregroundColor(),
    );
  }

  TextStyle titleText() => _textStyle(_ShoppingSizeText.title);
  TextStyle nameText() => _textStyle(_ShoppingSizeText.name);
  TextStyle priceText() => _textStyle(_ShoppingSizeText.price);
  TextStyle amountText() => _textStyle(_ShoppingSizeText.amount);
  TextStyle editableText() => _textStyle(_ShoppingSizeText.editableText);
  TextStyle normalText() => _textStyle(_ShoppingSizeText.normal);
}
