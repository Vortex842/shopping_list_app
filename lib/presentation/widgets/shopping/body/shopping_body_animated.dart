import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/providers/on_change_states/on_side_menu_active_provider.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/body_transfrom.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/shopping.barrel.dart';

class ShoppingAnimatedBody extends HookConsumerWidget {
  const ShoppingAnimatedBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    final onSideMenuActive = ref.watch(onSideMenuActiveProvider);
    useValueChanged(
      onSideMenuActive,
      (_, __) async {
        if (onSideMenuActive) {
          controller.forward();
        } else {
          controller.reverse();
        }
      },
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => BodyTransform(
        value: controller.value,
        body: Column(
          children: [
            const Expanded(
              child: ShoppingBody(),
            ),
            Visibility(
              visible: !onSideMenuActive,
              child: const ShoppingBottom(),
            ),
          ],
        ),
      ),
    );
  }
}
