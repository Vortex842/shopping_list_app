import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/presentation/providers/providers.barrel.dart';
import '/presentation/widgets/shopping/shopping.barrel.dart';
import '../body_transform.dart';

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

    controller.addStatusListener((status) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (status == AnimationStatus.forward) {
          ref.read(sideMenuShownProvider.notifier).update((state) => true);
        } else if (status == AnimationStatus.dismissed) {
          ref.read(sideMenuShownProvider.notifier).update((state) => false);
        }
      });
    });

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => BodyTransform(
        value: controller.value,
        body: const Column(
          children: [
            Expanded(
              child: ShoppingBody(),
            ),
            ShoppingBottom(),
          ],
        ),
      ),
    );
  }
}
