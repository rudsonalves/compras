import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/ui/core/ui/dialogs/app_snack_bar.dart';
import '/utils/result.dart';
import '/domain/dto/shopping/shopping_dto.dart';
import '/ui/core/ui/buttons/big_button.dart';
import 'edit_shopping_view_model.dart';
import '/utils/validates/generic_validations.dart';
import '/domain/enums/enums.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/core/ui/form_fields/basic_form_field.dart';
import '/ui/core/ui/form_fields/enum_form_field.dart';

class EditShoppingView extends StatefulWidget {
  final EditShoppingViewModel viewModel;

  const EditShoppingView({
    super.key,
    required this.viewModel,
  });

  @override
  State<EditShoppingView> createState() => _EditShoppingViewState();
}

class _EditShoppingViewState extends State<EditShoppingView> {
  late final EditShoppingViewModel _viewModel;

  final _formKey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _descriptionController = TextEditingController();

  ShoppingType _type = ShoppingType.supermarket;

  @override
  void initState() {
    _viewModel = widget.viewModel;
    _viewModel.saving.addListener(_onSaved);

    super.initState();
  }

  @override
  void dispose() {
    _viewModel.saving.removeListener(_onSaved);

    _namecontroller.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abrido uma Compra'),
        elevation: 5,
        centerTitle: true,
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
              Padding(
                padding: EdgeInsets.all(dimens.paddingScreenAll),
                child: SizedBox(
                  height: 128,
                  width: 128,
                  child: FlutterLogo(),
                ),
              ),
              BasicFormField(
                labelText: 'Nome',
                controller: _namecontroller,
                validator: GenericValidations.name,
                textCapitalization: TextCapitalization.words,
              ),
              BasicFormField(
                labelText: 'Descrição',
                controller: _descriptionController,
                validator: GenericValidations.notEmpty,
                textCapitalization: TextCapitalization.sentences,
              ),
              EnumFormField<ShoppingType>(
                title: 'Tipo de Compra',
                values: ShoppingType.values,
                labelBuilder: (type) => type.label,
                initialValue: _type,
                // layout: EnumFormLayout.row,
                onChanged: _changeType,
              ),
              SizedBox(height: dimens.spacingVertical),
              ListenableBuilder(
                listenable: _viewModel.saving,
                builder: (context, _) {
                  return BigButton(
                    color: Colors.green,
                    onPressed: _onSave,
                    label: 'Criar',
                    isRunning: _viewModel.saving.running,
                    iconData: Symbols.add_shopping_cart_rounded,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeType(ShoppingType? type) {
    if (type == null) return;
    _type = type;
  }

  void _onSave() {
    if (_viewModel.saving.running ||
        _formKey.currentState == null ||
        !_formKey.currentState!.validate()) {
      return;
    }

    final dto = ShoppingDto.create(
      name: _namecontroller.text,
      description: _descriptionController.text,
      type: _type,
    );

    _viewModel.saving.execute(dto);
  }

  void _onSaved() {
    if (_viewModel.saving.running) return;

    final result = _viewModel.saving.result!;

    switch (result) {
      case Success(value: final shopping):
        debugPrint(shopping.toString());
        Navigator.pop(context);
        break;

      case Failure():
        AppSnackBar.showBottom(
          context,
          title: 'Erro',
          iconTitle: Symbols.error_rounded,
          isError: true,
          message: 'Ocorreu um erro ao criar a compra.',
        );
        break;
    }
  }
}
