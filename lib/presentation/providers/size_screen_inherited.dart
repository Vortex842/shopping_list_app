import 'package:flutter/material.dart';

class SizeScreenInherited extends InheritedWidget {
  final Size? sizeScreen;

  const SizeScreenInherited({
    super.key,
    required this.sizeScreen,
    required super.child,
  });

  static SizeScreenInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeScreenInherited>();
  }

  @override
  bool updateShouldNotify(SizeScreenInherited oldWidget) => true;
}
