import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ShoppingDecoration on WidgetRef {
  List<BoxShadow> get shadows => [
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 5,
          spreadRadius: 1,
          color: Colors.black.withOpacity(0.15),
        ),
        BoxShadow(
          offset: const Offset(0, 1),
          blurRadius: 3,
          spreadRadius: 0,
          color: Colors.black.withOpacity(0.3),
        ),
      ];

  BorderRadius get bodyRadius => BorderRadius.circular(30);
  BorderRadius get buttonRadius => BorderRadius.circular(16);
}
