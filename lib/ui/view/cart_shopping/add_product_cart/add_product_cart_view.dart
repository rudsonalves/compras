import 'package:compras/domain/models/shopping/shopping_model.dart';
import 'package:compras/ui/core/ui/form_fields/sugestion_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/data/services/exceptions/exceptions.dart';
import '/domain/dto/cart_item_dto/cart_item_dto.dart';
import '/routing/routes.dart';
import '/ui/core/ui/dialogs/app_snack_bar.dart';
import '/utils/result.dart';
import '/ui/core/ui/buttons/big_button.dart';
import '/domain/enums/enums.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/core/ui/editing_controllers/number_editing_controller.dart';
import '/ui/core/ui/form_fields/basic_form_field.dart';
import '/ui/core/ui/form_fields/enum_form_field.dart';
import '/ui/view/cart_shopping/add_product_cart/add_product_cart_view_model.dart';
import '/utils/validates/generic_validations.dart';

class AddProductCartView extends StatefulWidget {
  final AddProductCartViewModel viewModel;
  final ShoppingModel shopping;

  const AddProductCartView({
    super.key,
    required this.viewModel,
    required this.shopping,
  });

  @override
  State<AddProductCartView> createState() => _AddProductCartViewState();
}

class _AddProductCartViewState extends State<AddProductCartView> {
  late final AddProductCartViewModel _viewModel;

  final _formKey = GlobalKey<FormState>();
  final _barCodeController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = NumberEditingController();
  final _quantityController = NumberEditingController(decimalDigits: 0);
  final _weightController = NumberEditingController(decimalDigits: 3);
  final _categoryController = TextEditingController();
  final _subCategoryController = TextEditingController();

  final _subCategoryFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  final _saleBy = ValueNotifier<SaleBy>(SaleBy.unit);
  String? _categoryId;
  String? _subCategoryId;

  @override
  void initState() {
    _viewModel = widget.viewModel;

    _viewModel.findProductByBarCode.addListener(_findProduct);

    _quantityController.numberValue = 1;

    super.initState();
  }

  @override
  void dispose() {
    _viewModel.findProductByBarCode.removeListener(_findProduct);

    _barCodeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _weightController.dispose();
    _saleBy.dispose();

    _subCategoryFocusNode.dispose();
    _priceFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);
    final categoriesNames = _viewModel.categoriesNames;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
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

              BasicFormField(
                labelText: 'Descrição do Produto',
                hintText: 'Digite a descrição do produto',
                controller: _descriptionController,
                validator: GenericValidations.notEmpty,
              ),

              SugestionTextField(
                labelText: 'Categoria',
                hintText: 'Selecione uma categoria para o produto',
                controller: _categoryController,
                sugestions: categoriesNames,
                nextFocusNode: _subCategoryFocusNode,
                onChanged: _selectCategory,
              ),

              ListenableBuilder(
                listenable: _viewModel.fetchAllSubcategories,
                builder: (context, _) {
                  final subCategoriesNames = _categoryId == null
                      ? <String>[]
                      : _viewModel.subCategoriesNames(
                          _categoryId!,
                        );
                  return SugestionTextField(
                    focusNode: _subCategoryFocusNode,
                    nextFocusNode: _priceFocusNode,
                    labelText: 'Sub-Categoria',
                    hintText: 'Selecione uma sub-categoria para o produto',
                    controller: _subCategoryController,
                    sugestions: subCategoriesNames,
                    onChanged: _selectSubCategory,
                  );
                },
              ),

              // Row(
              //   spacing: dimens.spacingHorizontal,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: SugestionTextField(
              //         labelText: 'Categoria',
              //         hintText: 'Selecione uma categoria para o produto',
              //         controller: _categoryController,
              //         sugestions: _viewModel.categoriesNames,
              //       ),
              //     ),
              //     Expanded(
              //       child: BasicFormField(
              //         labelText: 'Sub-Categoria',
              //         hintText: 'Selecione uma sub-categoria para o produto',
              //         controller: _subCategoryController,
              //       ),
              //     ),
              //   ],
              // ),
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
                        focusNode: _priceFocusNode,
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        validator: (_) => GenericValidations.notZero(
                          _priceController.numberValue,
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

  void _selectCategory(String? value) {
    if (value == null) return;

    _categoryId = _viewModel.categoryIdFromName(value);
    if (_categoryId == null) return;

    _viewModel.fetchAllSubcategories.execute(_categoryId!);
  }

  void _selectSubCategory(String? value) {
    if (value == null) return;

    _subCategoryId = _viewModel.subCategoryIdFromName(value, _categoryId!);
    if (_subCategoryId == null) return;
  }

  void _findProduct() {
    if (_viewModel.findProductByBarCode.running) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black54,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      return;
    } else {
      Navigator.of(context, rootNavigator: true).pop();

      final result = _viewModel.findProductByBarCode.result!;
      switch (result) {
        case Success(value: final product):
          if (product != null) {
            _nameController.text = product.name;
            _descriptionController.text = product.description;
            _categoryController.text = product.category ?? '';
            _subCategoryController.text = product.subCategory ?? '';
            _saleBy.value = product.saleBy;
          }
          break;
        case Failure(:final error):
          final (
            title,
            message,
            duration,
            isErro,
            iconTitle,
          ) = error is RecordNotFoundException
              ? (
                  'Produto não Encontrado',
                  'O produto não foi encontrado no banco de dados.\n'
                      'Um novo será registrado com os dados informados.',
                  5,
                  false,
                  Symbols.info_rounded,
                )
              : (
                  'Erro ao buscar produto',
                  'Ocorreu um erro ao buscar o produto.',
                  3,
                  true,
                  Symbols.error_rounded,
                );

          AppSnackBar.showBottom(
            context,
            title: title,
            iconTitle: Symbols.error_rounded,
            isError: isErro,
            message: message,
            duration: Duration(seconds: duration),
          );
          break;
      }
    }
  }

  void _toggleSaleType(SaleBy? value) {
    _saleBy.value = _saleBy.value == SaleBy.unit ? SaleBy.weight : SaleBy.unit;
  }

  void _saving() {
    if (_formKey.currentState == null ||
        !_formKey.currentState!.validate() && _viewModel.save.running) {
      return;
    }

    final cartItem = CartItemDto(
      shoppingId: widget.shopping.id,
      name: _nameController.text,
      description: _descriptionController.text,
      barCode: _barCodeController.text,
      category: _categoryController.text,
      subCategory: _subCategoryController.text,
      saleBy: _saleBy.value,
      price: (_priceController.numberValue * 100).round(),
      quantity: _saleBy.value == SaleBy.unit
          ? (_quantityController.numberValue).round()
          : (_weightController.numberValue * 1000).round(),
    );

    _viewModel.save.execute(cartItem);
  }

  Future<void> _barcodeScanner() async {
    try {
      final response = await context.push(Routes.scanner.path);
      if (response == null) return;

      _barCodeController.text = response as String;

      // busca produto pelo código de barras
      _viewModel.findProductByBarCode.execute(_barCodeController.text);
    } catch (err) {
      debugPrint(err.toString());
    }
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
}
