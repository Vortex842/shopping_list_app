import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ShoppingSize on WidgetRef {
  double get buttonProductHeight => 60;
  double get _bottomNormalHeight => 80;
  double get _bottomActiveHeight => 160;
  double bottomHeight(bool isActive) =>
      isActive ? _bottomActiveHeight : _bottomNormalHeight;
  double get _editableProductWidth => 180;
  double get _editableAmountWidth => 45;
  double get _editablePriceWidth => 90;
  double editableTextWidth(TextInputType textType) =>
      textType == TextInputType.text
          ? _editableProductWidth
          : textType == TextInputType.phone
              ? _editableAmountWidth
              : textType == TextInputType.number
                  ? _editablePriceWidth
                  : 0;
}
