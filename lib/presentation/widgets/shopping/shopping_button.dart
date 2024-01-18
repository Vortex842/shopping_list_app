import 'package:flutter/material.dart';

import '../../palette/color_theme.dart';
import '../../palette/text_theme.dart';

class ShoppingButton extends StatelessWidget {
  final String name;
  final double price;
  final int amount;

  const ShoppingButton({
    super.key,
    required this.name,
    required this.price,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: context.buttonColor(true),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: context.pruductText(ShoppingSizeText.product),
                    ),
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: context.pruductText(ShoppingSizeText.price),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "$amount",
                  style: context.pruductText(ShoppingSizeText.amount),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
