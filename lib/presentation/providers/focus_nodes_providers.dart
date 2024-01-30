import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final focusNodeProductProvider = StateProvider<FocusNode>((ref) {
  return FocusNode();
});

final focusNodeAmountProvider = StateProvider<FocusNode>((ref) {
  return FocusNode();
});

final focusNodePriceProvider = StateProvider<FocusNode>((ref) {
  return FocusNode();
});

final focusProviders = StateProvider<List<FocusNode>>((ref) {
  final focusNodeProduct = ref.watch(focusNodeProductProvider);
  final focusNodeAmount = ref.watch(focusNodeAmountProvider);
  final focusNodePrice = ref.watch(focusNodePriceProvider);

  return [focusNodeProduct, focusNodeAmount, focusNodePrice];
});
