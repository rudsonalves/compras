import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/models/shopping/shopping_model.dart';
import '/ui/core/themes/fonts.dart';
import '/ui/core/ui/dismissibles/dismissible_container.dart';
import '/utils/extensions/date_time_extensions.dart';

class ShoppingListTile extends StatelessWidget {
  final ShoppingModel shopping;
  final void Function(ShoppingModel shopping) openShopping;
  final void Function(ShoppingModel shopping) editShopping;
  final Future<bool> Function(ShoppingModel shopping) deleteShopping;

  const ShoppingListTile({
    super.key,
    required this.shopping,
    required this.openShopping,
    required this.editShopping,
    required this.deleteShopping,
  });

  @override
  Widget build(BuildContext context) {
    final fontStyle = AppFontsStyle.of(context);

    return Dismissible(
      key: UniqueKey(),
      background: dismissibleContainer(
        context,
        alignment: Alignment.centerLeft,
        color: Colors.green.withValues(alpha: 0.45),
        icon: Symbols.edit_square_rounded,
        label: 'Editar',
      ),
      secondaryBackground: dismissibleContainer(
        context,
        alignment: Alignment.centerRight,
        color: Colors.red.withValues(alpha: 0.45),
        icon: Symbols.delete_rounded,
        label: 'Remover',
      ),
      child: ListTile(
        title: Text(shopping.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(shopping.description),
            Text(shopping.createdAt!.toBrDateTime()),
          ],
        ),
        leading: Icon(shopping.type.iconData),
        trailing: Text(
          'R\$ ${((shopping.totalPrice) / 100).toStringAsFixed(2)}',
          style: fontStyle.bodyTextStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => openShopping(shopping),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          editShopping(shopping);
          return false;
        } else if (direction == DismissDirection.endToStart) {
          return await deleteShopping(shopping);
        }

        return false;
      },
    );
  }
}
