import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/on_change_states/on_add_cart_provider.dart';

import '../providers/dark_mode_provider.dart';

enum _ShoppingColors {
  lightPage(0xFFFFFFFF),
  lightForeground(0xFF1D1B20),
  lightForegroundDisable(0xFFCECECE),
  lightCard(0xFFF7F7F7),
  lightButton(0xFFEEEEEE),
  lightCardAddCart(0xFFFFDFD6),
  lightButtonAddCart(0xFFFFD4C6),
  lightEditableText(0xFFE6E5E5),
  darkPage(0xFF1D1B20),
  darkForeground(0xFFD2C2EB),
  darkForegroundDisable(0xFF494949),
  darkCard(0xFF211F26),
  darkButton(0xFF2B2930),
  darkCardAddCart(0xFF331C16),
  darkButtonAddCart(0xFF472319),
  darkEditableText(0xFF2B2930),
  editForeground(0xFF0B4B01),
  editBackground(0xFF59FF56),
  deleteForeground(0xFF780000),
  deleteBackground(0xFFFF5656),
  selectForeground(0xFF430078),
  selectBackground(0xFFAB56FF),
  leaveCartBackground(0xFF854205),
  leaveCartForeground(0xFFFF701D),
  buttonBottomBarForeground(0xFF430078),
  buttonBottomBarForeground2(0xFFAB56FF);

  final int _hexColor;

  Color get color => Color(_hexColor);

  const _ShoppingColors(this._hexColor);
}

extension ShoppingColors on WidgetRef {
  Color pageColor() => (watch(isDarkProvider)
          ? _ShoppingColors.darkPage
          : _ShoppingColors.lightPage)
      .color;
  Color cardColor() => (watch(isDarkProvider)
          ? watch(onAddCartProvider)
              ? _ShoppingColors.darkCardAddCart
              : _ShoppingColors.darkCard
          : watch(onAddCartProvider)
              ? _ShoppingColors.lightCardAddCart
              : _ShoppingColors.lightCard)
      .color;
  Color buttonColor() => (watch(isDarkProvider)
          ? watch(onAddCartProvider)
              ? _ShoppingColors.darkButtonAddCart
              : _ShoppingColors.darkButton
          : watch(onAddCartProvider)
              ? _ShoppingColors.lightButtonAddCart
              : _ShoppingColors.lightButton)
      .color;
  Color editIconColor(bool isIcon) =>
      (isIcon ? _ShoppingColors.editForeground : _ShoppingColors.editBackground)
          .color;
  Color deleteIconColor(bool isIcon) => (isIcon
          ? _ShoppingColors.deleteForeground
          : _ShoppingColors.deleteBackground)
      .color;
  Color selectIconColor(bool isIcon) => (isIcon
          ? _ShoppingColors.selectForeground
          : _ShoppingColors.selectBackground)
      .color;
  Color leaveCartIconColor(bool isIcon) => (!isIcon
          ? _ShoppingColors.leaveCartForeground
          : _ShoppingColors.leaveCartBackground)
      .color;
  Color foregroundColor() => (watch(isDarkProvider)
          ? _ShoppingColors.darkForeground
          : _ShoppingColors.lightForeground)
      .color;
  Color foregroundDisableColor() => (watch(isDarkProvider)
          ? _ShoppingColors.darkForegroundDisable
          : _ShoppingColors.lightForegroundDisable)
      .color;
  Color buttonConfirmCancelBackground() =>
      read(isDarkProvider) ? const Color(0xFFE6DAFA) : const Color(0xFFF0E8FF);
  Color buttonConfirmCancelForeground(bool isConfirm) => isConfirm
      ? _ShoppingColors.buttonBottomBarForeground.color
      : _ShoppingColors.buttonBottomBarForeground2.color;
  Color editableTextColor() => (watch(isDarkProvider)
          ? _ShoppingColors.darkEditableText
          : _ShoppingColors.lightEditableText)
      .color;
}
