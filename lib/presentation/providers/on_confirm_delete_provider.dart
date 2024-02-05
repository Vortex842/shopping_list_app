import 'package:flutter_riverpod/flutter_riverpod.dart';

final onProductDeleteProvider = StateProvider<bool>((ref) {
  return false;
});

final onConfirmCancelProvider = StateProvider<bool>((ref) {
  return false;
});
