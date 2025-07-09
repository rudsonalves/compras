import 'package:compras/domain/models/item/item_model.dart';
import 'package:compras/ui/core/themes/dimens.dart';
import 'package:compras/ui/core/themes/fonts.dart';
import 'package:compras/ui/core/ui/buttons/button_signature.dart';
import 'package:compras/ui/core/ui/dialogs/botton_sheet_message.dart.dart';
import 'package:compras/ui/core/ui/dismissibles/dismissible_container.dart';
import 'package:compras/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/routing/routes.dart';
import '/domain/models/shopping/shopping_model.dart';
import 'cart_shopping_view_model.dart';

class CartShoppingView extends StatefulWidget {
  final ShoppingModel shopping;
  final CartShoppingViewModel viewModel;

  const CartShoppingView({
    super.key,
    required this.viewModel,
    required this.shopping,
  });

  @override
  State<CartShoppingView> createState() => _CartShoppingViewState();
}

class _CartShoppingViewState extends State<CartShoppingView> {
  late final CartShoppingViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget.viewModel;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fontStyle = AppFontsStyle.of(context);
    final dimens = Dimens.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopping.name),
        elevation: 5,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Symbols.arrow_back_ios_new_rounded),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProductCart,
        child: Icon(Symbols.add_rounded),
      ),
      body: Padding(
        padding: EdgeInsets.all(dimens.paddingScreenAll),
        child: ListenableBuilder(
          listenable: _viewModel.cartItemsNotifier,
          builder: (context, _) {
            final items = _viewModel.itemsList;

            if (items.isEmpty) {
              return Center(
                child: Text('No items in the cart'),
              );
            }

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

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
                  child: Card(
                    color: colorScheme.primaryContainer,
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text('Quantity: ${item.quantity}'),
                      trailing: Text(
                        (item.unitPrince * item.quantity)
                            .toCurrencyWithSymbol(),
                        style: fontStyle.bodyLargeTextStyle,
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      _editItem(item);
                      return false;
                    } else if (direction == DismissDirection.endToStart) {
                      return await _deleteItem(item);
                    }

                    return false;
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _deleteItem(ItemModel item) async {
    final response =
        await BottonSheetMessage.show<bool?>(
          context,
          title: 'Remover usuário',
          body: [
            'Deseja realmente remover a compra **${item.name}**?',
          ],
          buttons: [
            ButtonSignature(
              label: 'Sim',
              onPressed: () => true,
            ),
            ButtonSignature(
              label: 'Não',
              onPressed: () => false,
            ),
          ],
        ) ??
        false;

    if (!response) return false;

    // _viewModel.delete.execute(shopping.id);

    return false;
  }

  void _editItem(ItemModel item) {}

  void _addProductCart() {
    context.pushNamed(
      Routes.addProductCart.name,
      extra: widget.shopping,
    );
  }
}
