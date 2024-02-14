import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ShoppingSize on WidgetRef {
  double get buttonProductHeight => 60;
  double get buttonAddProductHeight => 40;
  double get _bottomNormalHeight => 60;
  double get _bottomActiveHeight => 180;
  double bottomHeight(bool isActive) =>
      isActive ? _bottomActiveHeight : _bottomNormalHeight;
  double get editableNameWidth => 220;
  double get editableAmountWidth => 90;
  double get editablePriceWidth => 90;
}
