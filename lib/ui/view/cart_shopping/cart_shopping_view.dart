import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/ui/core/themes/dimens.dart';
import '/ui/core/ui/dialogs/card_message.dart';
import '/ui/view/cart_shopping/widgets/shopping_cart_title_row.dart';
import '/domain/models/item/item_model.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
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
      floatingActionButton: OverflowBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'addShoppingList',
            tooltip: 'Adicionar a lista de compras',
            onPressed: _addChoppingList,
            backgroundColor: colorScheme.onTertiary,
            child: Icon(Symbols.shopping_cart_rounded),
          ),
          FloatingActionButton(
            heroTag: 'addShoppingCart',
            tooltip: 'Adicionar ao carrinho',
            onPressed: _addProductCart,
            backgroundColor: colorScheme.onPrimary,
            child: Icon(Symbols.add_shopping_cart_rounded),
          ),
        ],
      ),
      body: Column(
        spacing: dimens.spacingVertical / 2,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: dimens.paddingScreenAll,
              right: dimens.paddingScreenAll,
              top: dimens.paddingScreenAll,
            ),
            child: ShoppingCartTitleRow(),
          ),

          ListenableBuilder(
            listenable: _viewModel.cartItemsNotifier,
            builder: (context, _) {
              final items = _viewModel.itemsList;
              if (items.isEmpty) {
                return Expanded(
                  child: SizedBox(
                    child: Center(
                      child: CardMessage(
                        title: 'Nenhum item no carrinho',
                        body: [
                          'Adicione itens pressionando os botões flutuantes'
                              ' abaixo:',
                          '= **Verde:** adicionar à lista de compras',
                          '+ **Azul:** adicionar ao carrinho',
                          'Produtos na lista são destacados em verde, e os'
                              ' no carrinho em azul.',
                          'Para mover um item da lista para o carrinho,'
                              ' basta tocar sobre ele na lista.',
                        ],
                      ),
                    ),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: items.length,
                separatorBuilder: (context, index) => Divider(),
                // const SizedBox(height: 12),
                itemBuilder: (context, index) => DismissibleCart(
                  item: items[index],
                  editItem: _editItem,
                  deleteItem: _deleteItem,
                  cardColor: colorScheme.primaryContainer.withValues(
                    alpha: 0.35,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _addChoppingList() {
    // context.pushNamed(
    //   Routes.addShoppingList.name,
    //   extra: widget.shopping,
    // );
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
