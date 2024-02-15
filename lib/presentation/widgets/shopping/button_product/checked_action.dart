import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/button_product/button_section.dart';

class CheckedAction extends StatelessWidget {
  final ButtonSection child;

  const CheckedAction({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50,
      ),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(0.95, 0.8),
        child: child,
      ),
    );
  }
}
