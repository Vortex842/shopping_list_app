import 'package:flutter/material.dart';

import '../../../palette/extensions.dart';

class ShoppingButton extends StatelessWidget {
  const ShoppingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.amber,
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
                      "Arroz",
                      style: context.pruductText(ShoppingSizeText.product),
                    ),
                    Text(
                      "\$847",
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
                  "12",
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
