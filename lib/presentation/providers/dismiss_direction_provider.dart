import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dismissDirectionProvider = StateProvider<DismissDirection>((ref) {
  return DismissDirection.none;
});

final isDismissProvider = StateProvider<bool>((ref) {
  final direction = ref.watch(dismissDirectionProvider);

  return direction == DismissDirection.endToStart;
});
