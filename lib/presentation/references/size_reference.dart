import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ShoppingSize on WidgetRef {
  double get buttonProductHeight => 60;
  double get _bottomNormalHeightPercent => 0.12;
  double get _bottomActiveHeightPercent => 0.25;
  double bottomHeightPercent(bool isActive) =>
      isActive ? _bottomActiveHeightPercent : _bottomNormalHeightPercent;
  double get editableNameWidth => 220;
  double get editableAmountWidth => 90;
  double get editablePriceWidth => 90;
}
