import '/ui/core/ui/buttons/big_button.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/core/ui/editing_controllers/number_editing_controller.dart';
import '/ui/core/ui/form_fields/basic_form_field.dart';
import '/ui/view/cart_shopping/add_item_list/add_item_list_view_model.dart';
import '/utils/validates/generic_validations.dart';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class AddItemListView extends StatefulWidget {
  final String shoppingId;
  final AddItemListViewModel viewModel;

  const AddItemListView({
    super.key,
    required this.shoppingId,
    required this.viewModel,
  });

  @override
  State<AddItemListView> createState() => _AddItemListViewState();
}

class _AddItemListViewState extends State<AddItemListView> {
  late final AddItemListViewModel _viewModel;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = NumberEditingController(decimalDigits: 0);
  final _weightController = NumberEditingController(decimalDigits: 3);

  final _saleByWeight = ValueNotifier<bool>(false);

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
        <WidgetStatesConstraint, Icon>{
          WidgetState.selected: Icon(Icons.check),
          WidgetState.any: Icon(Icons.close),
        },
      );

  @override
  void initState() {
    _viewModel = widget.viewModel;

    _quantityController.numberValue = 1;

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _weightController.dispose();
    _saleByWeight.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dimens = Dimens.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar à Lista de Compras'),
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
                labelText: 'Nome do Produto',
                hintText: 'Digite o nome do produto',
                controller: _nameController,
                prefixIconData: Symbols.box_rounded,
                validator: GenericValidations.name,
                textCapitalization: TextCapitalization.words,
              ),
              ValueListenableBuilder(
                valueListenable: _saleByWeight,
                builder: (_, byWeight, __) => Row(
                  spacing: dimens.spacingHorizontal,
                  children: [
                    Switch(
                      thumbIcon: thumbIcon,
                      value: byWeight,
                      onChanged: (value) {
                        _saleByWeight.value = value;
                      },
                    ),
                    Text('Vendido por\n${byWeight ? 'Peso' : 'Unidade'}'),
                    SizedBox(width: dimens.spacingHorizontal),
                    Expanded(
                      child: !byWeight
                          ? BasicFormField(
                              labelText: 'Quantidade',
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              // readOnly: true,
                              textAlign: TextAlign.center,
                              prefixIcon: IconButton(
                                onPressed: _addQuantity,
                                icon: Icon(Symbols.add_rounded),
                                color: colorScheme.tertiary,
                              ),
                              suffixIcon: IconButton(
                                onPressed: _removeQuantity,
                                icon: Icon(Symbols.remove_rounded),
                                color: colorScheme.tertiary,
                              ),
                              validator: (_) => GenericValidations.notZero(
                                _quantityController.numberValue,
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
                                _weightController.numberValue,
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
                    iconData: Symbols.add_shopping_cart_rounded,
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

  void _addQuantity() {
    final value = _quantityController.numberValue;
    _quantityController.numberValue = value + 1;
  }

  void _removeQuantity() {
    final value = _quantityController.numberValue;
    if (value <= 1) return;
    _quantityController.numberValue = value - 1;
  }

  void _saving() {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    // final dto = ListItemDto(
    //   shoppingId: widget.shoppingId,
    //   name: _nameController.text,
    //   // saleBy: _saleByWeight.value ? SaleBy.weight : SaleBy.unit,
    //   quantity: _saleByWeight.value
    //       ? (_weightController.numberValue * 1000).round()
    //       : (_quantityController.numberValue).round(),
    // );

    // _viewModel.save.execute(dto);
  }
}
