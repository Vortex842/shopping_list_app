import 'package:flutter/material.dart';

import 'shopping_text.dart';

class ShoppingButton extends StatelessWidget {
  const ShoppingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ShoppingProductText("Fideos"),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ShoppingPriceText("\$54222"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ShoppingAmountText("4"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
