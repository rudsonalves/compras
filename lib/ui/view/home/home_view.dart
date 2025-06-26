import 'package:flutter/material.dart';

import '/ui/core/ui/dialogs/bottom_sheet_dialog.dart';
import '/ui/core/ui/form_fields/basic_form_field.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
        elevation: 5,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Nenhuma compra cadastrada'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newShopping,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _newShopping() {
    BottonSheetDialog.show(
      context,
      title: 'Nova compra',
      body: [
        BasicFormField(
          labelText: 'Nome',
          hintText: 'Digite o nome da compra',
        ),
        BasicFormField(
          labelText: 'Descrição',
          hintText: 'Digite a descrição da compra',
        ),
      ],
    );
  }
}
