import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ShoppingSize on WidgetRef {
  double get buttonProductHeight => 60;
  double get _bottomNormalHeight => 80;
  double get _bottomActiveHeight => 160;
  double bottomHeight(bool isActive) =>
      isActive ? _bottomActiveHeight : _bottomNormalHeight;
  double get editableProductWidth => 180;
  double get editableAmountWidth => 45;
  double get editablePriceWidth => 90;
}
