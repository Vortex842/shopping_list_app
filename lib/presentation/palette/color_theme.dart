import 'package:flutter/material.dart';

enum _ShoppingColors {
  lightPage(0xFFFFFFFF),
  lightCard(0xFFF3EDF7),
  lightButton(0xFFECE6F0),
  darkPage(0xFF1D1B20),
  darkCard(0xFF211F26),
  darkButton(0xFF2B2930),
  editForeground(0xFF0B4B01),
  editBackground(0xFF59FF56),
  deleteForeground(0xFF780000),
  deleteBackground(0xFFFF5656);

  final int _hexColor;

  Color get color => Color(_hexColor);

  const _ShoppingColors(this._hexColor);
}

extension ShoppingColors on BuildContext {
  Color pageColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkPage : _ShoppingColors.lightPage).color;
  Color cardColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkCard : _ShoppingColors.lightCard).color;
  Color buttonColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkButton : _ShoppingColors.lightButton).color;
  Color editColor(bool isDark) =>
      (isDark ? _ShoppingColors.editForeground : _ShoppingColors.editBackground)
          .color;
  Color deleteColor(bool isDark) => (isDark
          ? _ShoppingColors.deleteForeground
          : _ShoppingColors.deleteBackground)
      .color;
}
