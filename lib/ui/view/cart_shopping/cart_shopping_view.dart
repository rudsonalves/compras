import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/models/item/item_model.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/core/ui/buttons/button_signature.dart';
import '/ui/core/ui/dialogs/botton_sheet_message.dart.dart';
import '/ui/view/cart_shopping/widgets/dismissible_cart.dart';
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
    final dimens = Dimens.of(context);

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
              itemBuilder: (context, index) => DismissibleCart(
                item: items[index],
                editItem: _editItem,
                deleteItem: _deleteItem,
              ),
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
