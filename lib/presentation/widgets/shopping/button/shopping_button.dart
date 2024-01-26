import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';

import '../../../providers/providers.barrel.dart';
import '../../../references/references.barrel.dart';
import '/data/domain/entities/product.dart';
import 'button_section.dart';

class ShoppingButton extends HookConsumerWidget {
  final Product product;

  const ShoppingButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonAction = useState(ButtonActionType.none);
    final buttonSection = useMemoized(
      () => ButtonSection(product),
    );

    useEffect(() {
      buttonAction.value =
          product.isChecked ? ButtonActionType.select : ButtonActionType.none;
      return null;
    }, [product.isChecked]);

    final isDark = ref.watch(isDarkMode);

    return GestureDetector(
      onLongPress: () {
        // ACTION ON LONG PRESS
        ref.read(productsProvider.notifier).toggleCheck(product.id);
      },
      child: Container(
        height: 60,
        decoration: ref.buttonBackgroundDecoration(
          isDark,
          actionType: buttonAction.value,
        ),
        child: ClipRRect(
          borderRadius: ref.buttonRadius,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Icon(
                    ref.iconType(actionType: buttonAction.value),
                  ),
                ),
              ),
              product.isChecked
                  ? Padding(
                      padding: const EdgeInsets.only(
                        right: 50,
                      ),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..scale(0.95, 0.8),
                        child: buttonSection,
                      ),
                    )
                  : buttonSection,
            ],
          ),
        ),
      ),
    );
  }
}
