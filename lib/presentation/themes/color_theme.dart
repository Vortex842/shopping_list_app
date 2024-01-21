import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _ShoppingColors {
  lightPage(0xFFFFFFFF),
  lightForeground(0xFF1D1B20),
  lightBody(0xFFF7F7F7),
  lightButton(0xFFEEEEEE),
  darkPage(0xFF1D1B20),
  darkForeground(0xFFD2C2EB),
  darkBody(0xFF211F26),
  darkButton(0xFF2B2930),
  editForeground(0xFF0B4B01),
  editBackground(0xFF59FF56),
  deleteForeground(0xFF780000),
  deleteBackground(0xFFFF5656);

  final int _hexColor;

  Color get color => Color(_hexColor);

  const _ShoppingColors(this._hexColor);
}

extension ShoppingColors on WidgetRef {
  Color pageColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkPage : _ShoppingColors.lightPage).color;
  Color bodyColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkBody : _ShoppingColors.lightBody).color;
  Color buttonColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkButton : _ShoppingColors.lightButton).color;
  Color editColor(bool isDark) =>
      (isDark ? _ShoppingColors.editForeground : _ShoppingColors.editBackground)
          .color;
  Color deleteColor(bool isDark) => (isDark
          ? _ShoppingColors.deleteForeground
          : _ShoppingColors.deleteBackground)
      .color;
  Color foregroundColor(bool isDark) => (isDark
          ? _ShoppingColors.darkForeground
          : _ShoppingColors.lightForeground)
      .color;
}
