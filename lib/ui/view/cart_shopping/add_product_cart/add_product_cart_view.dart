import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/enums/enums.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/core/ui/editing_controllers/currency_editing_controller.dart';
import '/ui/core/ui/form_fields/basic_form_field.dart';
import '/ui/core/ui/form_fields/enum_form_field.dart';
import '/ui/view/cart_shopping/add_product_cart/add_product_cart_view_model.dart';
import '/utils/validates/generic_validations.dart';

class AddProductCartView extends StatefulWidget {
  final AddProductCartViewModel viewModel;

  const AddProductCartView({super.key, required this.viewModel});

  @override
  State<AddProductCartView> createState() => _AddProductCartViewState();
}

class _AddProductCartViewState extends State<AddProductCartView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = CurrencyEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicinar Produto'),
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Symbols.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(dimens.paddingScreenAll),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: dimens.spacingVertical,
            children: [
              Center(
                child: FilledButton.tonalIcon(
                  onPressed: _barcodeScanner,
                  label: Text('Ler Código de Barras'),
                  icon: const Icon(Symbols.barcode_rounded),
                ),
              ),
              BasicFormField(
                labelText: 'Nome do Produto',
                hintText: 'Digite o nome do produto',
                controller: _nameController,
                validator: GenericValidations.name,
              ),
              BasicFormField(
                labelText: 'Descrição do Produto',
                hintText: 'Digite a descrição do produto',
                controller: _descriptionController,
                validator: GenericValidations.notEmpty,
              ),
              EnumFormField<SaleBy>(
                title: 'Vendido por',
                values: SaleBy.values,
                labelBuilder: (value) => value.label,
                layout: EnumFormLayout.row,
              ),
              Row(
                spacing: dimens.spacingHorizontal * 2,
                children: [
                  Expanded(
                    child: BasicFormField(
                      labelText: 'Preço',
                      hintText: 'R\$ 0,00',
                      controller: _priceController,
                      validator: GenericValidations.notEmpty,
                    ),
                  ),
                  Expanded(
                    child: BasicFormField(
                      labelText: 'Quantidade',
                      hintText: '',
                      controller: _priceController,
                      validator: GenericValidations.notEmpty,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _barcodeScanner() {}
}
