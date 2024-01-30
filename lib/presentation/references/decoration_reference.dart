import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';

import 'references.barrel.dart';

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

  BorderRadius get cardRadius => BorderRadius.circular(30);
  BorderRadius get buttonRadius => BorderRadius.circular(16);
  Radius get nothingRadius => const Radius.circular(0);

  BoxDecoration bodyDecoration(bool isDark) => BoxDecoration(
        color: cardColor(isDark),
        boxShadow: shadows,
        borderRadius: cardRadius,
      );
  BoxDecoration buttonBackgroundDecoration(
    bool isDark, {
    ButtonActionType actionType = ButtonActionType.none,
  }) {
    Color color;

    switch (actionType) {
      case ButtonActionType.none:
        color = buttonColor(isDark);
        break;
      case ButtonActionType.edit:
        color = editColor(false);
        break;
      case ButtonActionType.delete:
        color = deleteColor(false);
        break;
      case ButtonActionType.select:
        color = selectColor(false);
        break;
    }

    return BoxDecoration(
      color: color,
      boxShadow: shadows,
      borderRadius: buttonRadius,
    );
  }

  BoxDecoration buttonSectionDecoration(bool isDark) => BoxDecoration(
        color: buttonColor(isDark),
        boxShadow: shadows,
        borderRadius: buttonRadius,
      );
  BoxDecoration bottomDecoration(bool isDark) => BoxDecoration(
        boxShadow: shadows,
        borderRadius: cardRadius.copyWith(
          bottomLeft: nothingRadius,
          bottomRight: nothingRadius,
        ),
        color: cardColor(isDark),
      );
}