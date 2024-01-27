import 'package:flutter/material.dart';

import '../../data/domain/entities/product.dart';

class ProductInherited extends InheritedWidget {
  final Product product;

  const ProductInherited({
    super.key,
    required this.product,
    required super.child,
  });

  static ProductInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductInherited>();
  }

  @override
  bool updateShouldNotify(ProductInherited oldWidget) => true;
}
