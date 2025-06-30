import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/ui/core/ui/buttons/button_signature.dart';
import '/ui/core/ui/dialogs/app_snack_bar.dart';
import '/ui/core/ui/dialogs/botton_sheet_message.dart.dart';
import '/utils/result.dart';
import '/ui/view/home/widgets/shopping_list_tile.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/routing/routes.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/view/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeView({
    super.key,
    required this.viewModel,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget.viewModel;
    _viewModel.delete.addListener(_deleted);

    super.initState();
  }

  @override
  void dispose() {
    _viewModel.delete.removeListener(_deleted);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(dimens.paddingScreenAll),
        child: ListenableBuilder(
          listenable: _viewModel.notifier,
          builder: (context, _) {
            if (_viewModel.load.running) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final shoppings = _viewModel.shoppings;

            if (shoppings.isEmpty) {
              return const Center(
                child: Text('Nenhuma compra cadastrada'),
              );
            }

            return ListView.separated(
              itemCount: shoppings.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) => ShoppingListTile(
                shopping: shoppings[index],
                openShopping: _openShopping,
                editShopping: _editShopping,
                deleteShopping: _deleteShopping,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addShopping,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addShopping() {
    context.push(Routes.editShopping.path);
  }

  void _openShopping(ShoppingModel shopping) {
    debugPrint('Open: ${shopping.name}');
    context.push(Routes.shopping.path, extra: shopping);
  }

  void _editShopping(ShoppingModel shopping) {
    debugPrint('Edit: ${shopping.name}');
    context.push(Routes.editShopping.path, extra: shopping);
  }

  Future<bool> _deleteShopping(ShoppingModel shopping) async {
    final response =
        await BottonSheetMessage.show<bool?>(
          context,
          title: 'Remover usuário',
          body: [
            'Deseja realmente remover a compra **${shopping.name}**?',
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

    _viewModel.delete.execute(shopping.id);

    return false;
  }

  void _deleted() {
    if (_viewModel.delete.running) return;

    final result = _viewModel.delete.result!;

    switch (result) {
      case Success():
        break;

      case Failure():
        AppSnackBar.showBottom(
          context,
          title: 'Erro',
          iconTitle: Symbols.error_rounded,
          isError: true,
          message: 'Ocorreu um erro ao excluir a compra.',
        );
        break;
    }
  }
}
