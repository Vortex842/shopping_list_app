import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaveCartAction extends ConsumerWidget {
  final Widget child;

  const LeaveCartAction({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Transform(
      origin: const Offset(-2, 0),
      alignment: Alignment.centerLeft,
      transform: Matrix4.identity()..scale(0.85, 1.0),
      child: child,
    );
  }
}
