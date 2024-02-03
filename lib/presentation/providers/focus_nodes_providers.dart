import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final focusNodeNameProvider = StateProvider<FocusNode>((ref) {
  return FocusNode();
});

final focusNodeAmountProvider = StateProvider<FocusNode>((ref) {
  return FocusNode();
});

final focusNodePriceProvider = StateProvider<FocusNode>((ref) {
  return FocusNode();
});

final focusProviders = StateProvider<List<FocusNode>>((ref) {
  final focusNodeName = ref.watch(focusNodeNameProvider);
  final focusNodeAmount = ref.watch(focusNodeAmountProvider);
  final focusNodePrice = ref.watch(focusNodePriceProvider);

  return [focusNodeName, focusNodeAmount, focusNodePrice];
});
