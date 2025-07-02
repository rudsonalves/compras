import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/ui/core/ui/buttons/big_button.dart';
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
  late final AddProductCartViewModel _viewModel;

  final _formKey = GlobalKey<FormState>();
  final _barCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = CurrencyEditingController();
  final _quantityController = CurrencyEditingController(decimalDigits: 0);
  final _weightController = CurrencyEditingController(decimalDigits: 3);
  final _categoryController = TextEditingController();
  final _subCategoryController = TextEditingController();

  final _saleBy = ValueNotifier<SaleBy>(SaleBy.unit);

  @override
  void initState() {
    _viewModel = widget.viewModel;

    _quantityController.currencyValue = 1;

    super.initState();
  }

  @override
  void dispose() {
    _barCodeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _weightController.dispose();
    _saleBy.dispose();

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
              BasicFormField(
                labelText: 'Código de Barras',
                hintText: 'Digite ou leia o código de barras do produto',
                controller: _barCodeController,
                validator: GenericValidations.name,
                suffixIcon: IconButton(
                  icon: const Icon(Symbols.barcode_scanner_rounded),
                  onPressed: _barcodeScanner,
                ),
              ),
              BasicFormField(
                labelText: 'Nome do Produto',
                hintText: 'Digite o nome do produto',
                controller: _nameController,
                validator: GenericValidations.name,
              ),
              Row(
                spacing: dimens.spacingHorizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BasicFormField(
                      labelText: 'Categoria',
                      hintText: 'Selecione uma categoria para o produto',
                      controller: _categoryController,
                    ),
                  ),
                  Expanded(
                    child: BasicFormField(
                      labelText: 'Sub-Categoria',
                      hintText: 'Selecione uma sub-categoria para o produto',
                      controller: _subCategoryController,
                    ),
                  ),
                ],
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
                initialValue: _saleBy.value,
                labelBuilder: (value) => value.label,
                layout: EnumFormLayout.row,
                onChanged: _toggleSaleType,
              ),
              ValueListenableBuilder(
                valueListenable: _saleBy,
                builder: (_, value, __) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: dimens.spacingHorizontal * 2,
                  children: [
                    Expanded(
                      child: BasicFormField(
                        labelText: value == SaleBy.unit
                            ? 'Preço Unitário'
                            : 'Preço por kg',
                        prefixText: value == SaleBy.unit ? 'R\$' : 'R\$/kg',
                        hintText: ' 0,00',
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        validator: (_) => GenericValidations.notZero(
                          _priceController.currencyValue,
                        ),
                      ),
                    ),
                    Expanded(
                      child: value == SaleBy.unit
                          ? BasicFormField(
                              labelText: 'Quantidade',
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              // readOnly: true,
                              textAlign: TextAlign.center,
                              prefixIcon: IconButton(
                                onPressed: _addQuantity,
                                icon: Icon(Symbols.add_rounded),
                              ),
                              suffixIcon: IconButton(
                                onPressed: _removeQuantity,
                                icon: Icon(Symbols.remove_rounded),
                              ),
                              validator: (_) => GenericValidations.notZero(
                                _quantityController.currencyValue,
                              ),
                            )
                          : BasicFormField(
                              labelText: 'Peso (kg)',
                              suffixText: 'kg',
                              hintText: '0,000',
                              textAlign: TextAlign.center,
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              validator: (_) => GenericValidations.notZero(
                                _weightController.currencyValue,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              ListenableBuilder(
                listenable: Listenable.merge([
                  _viewModel.save,
                  _viewModel.update,
                ]),
                builder: (context, _) {
                  return BigButton(
                    label: 'Adicionar',
                    color: Colors.indigoAccent,
                    iconData: Symbols.add_rounded,
                    isRunning:
                        _viewModel.save.running || _viewModel.update.running,
                    onPressed: _saving,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSaleType(SaleBy? value) {
    _saleBy.value = _saleBy.value == SaleBy.unit ? SaleBy.weight : SaleBy.unit;
  }

  void _saving() {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
  }

  void _barcodeScanner() {}

  void _addQuantity() {
    final value = _quantityController.currencyValue;
    _quantityController.currencyValue = value + 1;
  }

  void _removeQuantity() {
    final value = _quantityController.currencyValue;
    if (value <= 1) return;
    _quantityController.currencyValue = value - 1;
  }
}
