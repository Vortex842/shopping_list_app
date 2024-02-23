import 'package:flutter/material.dart';
import 'package:shopping_list_app/presentation/enums/button_action_type.dart';
import 'package:shopping_list_app/presentation/widgets/shopping/button_product/icon_action_button.dart';

class IconsProductSection extends StatelessWidget {
  const IconsProductSection({
    super.key,
    required this.buttonAction,
  });

  final ValueNotifier<ButtonActionType> buttonAction;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: buttonAction.value == ButtonActionType.edit
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: IconActionButton(
          btnAction: buttonAction.value,
        ),
      ),
    );
  }
}
