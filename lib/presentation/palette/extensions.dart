import 'package:flutter/material.dart';

enum ShoppingSizeText {
  title(25),
  product(20),
  amount(16),
  price(12);

  final double size;

  const ShoppingSizeText(this.size);
}

extension ShoppingContext on BuildContext {
  TextStyle pruductText(ShoppingSizeText text) => TextStyle(
        fontSize: text.size,
        fontWeight: FontWeight.w700,
      );
}
