import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dismissDirectionProvider = StateProvider((ref) {
  return DismissDirection.none;
});
