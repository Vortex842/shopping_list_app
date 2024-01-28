import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _ShoppingColors {
  lightPage(0xFFFFFFFF),
  lightForeground(0xFF1D1B20),
  lightCard(0xFFF7F7F7),
  lightButton(0xFFEEEEEE),
  darkPage(0xFF1D1B20),
  darkForeground(0xFFD2C2EB),
  darkCard(0xFF211F26),
  darkButton(0xFF2B2930),
  editForeground(0xFF0B4B01),
  editBackground(0xFF59FF56),
  deleteForeground(0xFF780000),
  deleteBackground(0xFFFF5656),
  selectForeground(0xFF430078),
  selectBackground(0xFFAB56FF);

  final int _hexColor;

  Color get color => Color(_hexColor);

  const _ShoppingColors(this._hexColor);
}

extension ShoppingColors on WidgetRef {
  Color pageColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkPage : _ShoppingColors.lightPage).color;
  Color cardColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkCard : _ShoppingColors.lightCard).color;
  Color buttonColor(bool isDark) =>
      (isDark ? _ShoppingColors.darkButton : _ShoppingColors.lightButton).color;
  Color editColor(bool isIcon) =>
      (isIcon ? _ShoppingColors.editForeground : _ShoppingColors.editBackground)
          .color;
  Color deleteColor(bool isIcon) => (isIcon
          ? _ShoppingColors.deleteForeground
          : _ShoppingColors.deleteBackground)
      .color;
  Color selectColor(bool isIcon) => (isIcon
          ? _ShoppingColors.selectForeground
          : _ShoppingColors.selectBackground)
      .color;
  Color foregroundColor(bool isDark) => (isDark
          ? _ShoppingColors.darkForeground
          : _ShoppingColors.lightForeground)
      .color;
  Color buttonColorBottomBar(bool isDark) =>
      isDark ? const Color(0xFFD2C2EB) : const Color(0xFFEADDFF);
  Color get iconColorBottombar => const Color(0xFF21005D);
}
