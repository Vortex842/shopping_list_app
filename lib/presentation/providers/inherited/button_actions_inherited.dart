import 'package:flutter/material.dart';

import '/data/domain/entities/product.dart';

class ButtonDataInherited extends InheritedWidget {
  final Product product;
  final Widget buttonSection;
  final ValueNotifier<DismissDirection> dismissDirection;

  const ButtonDataInherited({
    super.key,
    required this.product,
    required this.buttonSection,
    required this.dismissDirection,
    required super.child,
  });

  static ButtonDataInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ButtonDataInherited>();
  }

  @override
  bool updateShouldNotify(ButtonDataInherited oldWidget) {
    return true;
  }
}