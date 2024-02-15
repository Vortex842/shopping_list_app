import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/on_change_states/on_add_cart_provider.dart';
import '/presentation/enums/button_action_type.dart';
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
  BorderRadius get buttonRadius => BorderRadius.circular(20);

  BoxDecoration bodyDecoration(bool isDark) => BoxDecoration(
        color: cardColor(),
        boxShadow: shadows,
        borderRadius: cardRadius,
      );
  BoxDecoration buttonBackgroundDecoration({
    ButtonActionType actionType = ButtonActionType.none,
  }) {
    final onAddCart = watch(onAddCartProvider);

    Color color;

    switch (actionType) {
      case ButtonActionType.none:
        color = onAddCart ? leaveCartIconColor(false) : buttonColor();
        break;
      case ButtonActionType.edit:
        color = editIconColor(false);
        break;
      case ButtonActionType.delete:
        color = deleteIconColor(false);
        break;
      case ButtonActionType.select:
        color = selectIconColor(false);
        break;
    }

    return BoxDecoration(
      color: color,
      borderRadius: buttonRadius,
    );
  }

  BoxDecoration buttonSectionDecoration(bool isDark) => BoxDecoration(
        color: buttonColor(),
        boxShadow: shadows,
        borderRadius: buttonRadius,
      );

  ButtonStyle textButtonStyle(bool isConfirm) => ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12),
        ),
        foregroundColor:
            MaterialStatePropertyAll(buttonConfirmCancelForeground(isConfirm)),
        backgroundColor: isConfirm
            ? MaterialStatePropertyAll(buttonConfirmCancelBackground())
            : null,
      );
}
