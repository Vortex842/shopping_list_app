import 'package:flutter/material.dart';

class CheckedAction extends StatelessWidget {
  final Widget child;

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
