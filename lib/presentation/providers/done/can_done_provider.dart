import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../product/editable_text_provider.dart';

final canDoneProvider = StateProvider<bool>((ref) {
  final controllers = ref.watch(controllerProviders);

  return !controllers.any((providerText) => ref.read(providerText).isEmpty);
});
