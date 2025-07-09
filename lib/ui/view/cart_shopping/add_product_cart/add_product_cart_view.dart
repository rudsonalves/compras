import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/dto/category_subcategory/category_subcategory_dto.dart';
import '/ui/core/ui/buttons/button_signature.dart';
import '/ui/core/ui/dialogs/bottom_sheet_dialog.dart';
import '/domain/models/shopping/shopping_model.dart';
import '/ui/core/themes/fonts.dart';
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

  final _subCategoryFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  final _saleBy = ValueNotifier<SaleBy>(SaleBy.unit);
  String? _productId;
  String? _categoryId;
  String? _subCategoryId;
  String? _subcatName;
  final _total = ValueNotifier<double>(0);

  @override
  void initState() {
    _viewModel = widget.viewModel;
    _viewModel.findProductByBarCode.addListener(_findProduct);
    _viewModel.saving.addListener(_saved);

    _saleBy.addListener(() => _calcTotal());

    _quantityController.numberValue = 1;

    super.initState();
  }

  @override
  void dispose() {
    _viewModel.findProductByBarCode.removeListener(_findProduct);
    _viewModel.saving.removeListener(_saved);
    _saleBy.removeListener(() => _calcTotal());

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
    final fontStyle = AppFontsStyle.of(context);
    final colorScheme = Theme.of(context).colorScheme;

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
                keyboardType: TextInputType.number,
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
                textCapitalization: TextCapitalization.words,
              ),

              BasicFormField(
                labelText: 'Descrição do Produto',
                hintText: 'Digite a descrição do produto',
                controller: _descriptionController,
                textCapitalization: TextCapitalization.sentences,
              ),

              InkWell(
                onTap: _searchCategory,
                child: AbsorbPointer(
                  child: BasicFormField(
                    labelText: 'Categoria',
                    hintText: 'Selecione uma categoria',
                    controller: _categoryController,
                    readOnly: true,
                  ),
                ),
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
                        focusNode: _priceFocusNode,
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        validator: (_) => GenericValidations.notZero(
                          _priceController.numberValue,
                        ),
                        onChanged: _calcTotalValue,
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
                              onChanged: _calcTotalValue,
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
                              onChanged: _calcTotalValue,
                            ),
                    ),
                  ],
                ),
              ),

              Center(
                child: ValueListenableBuilder(
                  valueListenable: _total,
                  builder: (context, value, _) {
                    return Text(
                      'Total: R\$ ${value.toStringAsFixed(2)}',
                      style: fontStyle.bodyExtraLargeTextStyle.copyWith(
                        color: colorScheme.primary,
                      ),
                    );
                  },
                ),
              ),

              ListenableBuilder(
                listenable: Listenable.merge([
                  _viewModel.saving,
                  _viewModel.update,
                ]),
                builder: (context, _) {
                  return BigButton(
                    label: 'Adicionar',
                    color: Colors.indigoAccent,
                    iconData: Symbols.add_shopping_cart_rounded,
                    isRunning:
                        _viewModel.saving.running || _viewModel.update.running,
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

  Future<void> _searchCategory() async {
    final CategorySubcategoryDto? result = await context
        .pushNamed<CategorySubcategoryDto>(
          Routes.searchCategory.name,
          extra: widget.shopping,
        );

    if (result != null) {
      final categoryText = CategorySubcategoryDto.string(
        result.category.name,
        result.subcategory.name,
      );
      _subcatName = result.subcategory.name;
      _categoryId = result.category.id;
      _categoryController.text = categoryText;
      _subCategoryId = result.subcategory.id;
    }
  }

  void _calcTotalValue(String? value) => _calcTotal();

  void _calcTotal() {
    final price = _priceController.numberValue;
    final weight = _weightController.numberValue;
    final quantity = _quantityController.numberValue;
    _total.value = price * (_saleBy.value == SaleBy.unit ? quantity : weight);
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
            final categoryText =
                product.categoryName != null && product.subCategoryName != null
                ? CategorySubcategoryDto.string(
                    product.categoryName ?? '',
                    product.subCategoryName ?? '',
                  )
                : '';
            _productId = product.id;
            _nameController.text = product.name;
            _descriptionController.text = product.description ?? '';
            _categoryController.text = categoryText;
            _subcatName = product.subCategoryName;
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
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    final description = _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim();

    final cartItem = CartItemDto(
      shoppingId: widget.shopping.id,
      productId: _productId,
      name: _nameController.text,
      description: description,
      barCode: _barCodeController.text,
      categoryName: _categoryController.text,
      categoryId: _categoryId,
      subCategoryName: _subcatName,
      subCategoryId: _subCategoryId,
      saleBy: _saleBy.value,
      price: (_priceController.numberValue * 100).round(),
      quantity: _saleBy.value == SaleBy.unit
          ? (_quantityController.numberValue).round()
          : (_weightController.numberValue * 1000).round(),
    );

    _viewModel.saving.execute(cartItem);
  }

  Future<void> _barcodeScanner() async {
    final response = await BottomSheetDialog.show<ThreeState>(
      context,
      title: 'Scannear Código de Barras',
      body: [
        Text(
          'Ler novo código de barras de produto ou pesquisar por um código passado?',
          textAlign: TextAlign.center,
        ),
      ],
      buttons: [
        ButtonSignature(
          label: 'Ler Novo',
          iconData: Symbols.qr_code_scanner_rounded,
          onPressed: () {
            return ThreeState.yes;
          },
        ),
        ButtonSignature(
          label: 'Pesquisar',
          iconData: Symbols.search_rounded,
          onPressed: () {
            return ThreeState.no;
          },
        ),
        ButtonSignature(
          label: 'Cancelar',
          iconData: Symbols.cancel_rounded,
          onPressed: () {
            return ThreeState.indeterminate;
          },
        ),
      ],
    );

    if (response == null || response == ThreeState.indeterminate) return;

    try {
      if (response == ThreeState.yes) {
        if (!mounted) return;
        final response = await context.push(Routes.scanner.path);
        if (response == null) return;

        _barCodeController.text = response as String;
      }

      if (_barCodeController.text.trim().isEmpty) return;

      _viewModel.findProductByBarCode.execute(_barCodeController.text);
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void _addQuantity() {
    final value = _quantityController.numberValue;
    _quantityController.numberValue = value + 1;
    _calcTotal();
  }

  void _removeQuantity() {
    final value = _quantityController.numberValue;
    if (value <= 1) return;
    _quantityController.numberValue = value - 1;
    _calcTotal();
  }

  void _saved() {
    if (_viewModel.saving.running) return;

    final result = _viewModel.saving.result!;
    switch (result) {
      case Success():
        AppSnackBar.showBottom(
          context,
          title: 'Sucesso',
          iconTitle: Symbols.check_rounded,
          message: 'Item adicionado ao carrinho.',
        );
        Navigator.of(context).pop();
        break;
      case Failure():
        AppSnackBar.showBottom(
          context,
          title: 'Erro',
          iconTitle: Symbols.error_rounded,
          isError: true,
          message: 'Ocorreu um erro ao adicionar o item ao carrinho.',
        );
        break;
    }
  }
}
