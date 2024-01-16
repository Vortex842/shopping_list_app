import 'package:flutter/material.dart';

class ShoppingProductText extends StatelessWidget {
  final String text;

  const ShoppingProductText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class ShoppingPriceText extends StatelessWidget {
  final String text;

  const ShoppingPriceText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class ShoppingAmountText extends StatelessWidget {
  final String text;

  const ShoppingAmountText(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
