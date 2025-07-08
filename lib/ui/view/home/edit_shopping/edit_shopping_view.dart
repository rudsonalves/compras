import 'package:compras/utils/extensions/date_time_extensions.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/domain/models/shopping/shopping_model.dart';
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
  final ShoppingModel? shopping;

  const EditShoppingView({
    super.key,
    this.shopping,
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
  bool _isEditing = false;
  String? _shoppingId;

  @override
  void initState() {
    _viewModel = widget.viewModel;
    _viewModel.saving.addListener(_onSaved);
    _viewModel.update.addListener(_onSaved);

    _initializeForm();

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
        title: Text('${_isEditing ? 'Editar' : 'Criar'} Compra'),
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
                suffixIcon: IconButton(
                  onPressed: () => _addDateIn(_namecontroller),
                  icon: Icon(Symbols.calendar_add_on_rounded),
                ),
              ),
              BasicFormField(
                labelText: 'Descrição',
                controller: _descriptionController,
                validator: GenericValidations.notEmpty,
                textCapitalization: TextCapitalization.sentences,
                suffixIcon: IconButton(
                  onPressed: () => _addDateIn(_descriptionController),
                  icon: Icon(Symbols.calendar_add_on_rounded),
                ),
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
                    label: _isEditing ? 'Salvar' : 'Criar',
                    isRunning: _viewModel.saving.running,
                    iconData: _isEditing
                        ? Symbols.save_rounded
                        : Symbols.add_rounded,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addDateIn(TextEditingController controller) {
    final text = controller.text.trim();
    final date = DateTime.now().toBrDate();

    controller.text = text.isEmpty ? date : '${controller.text.trim()} $date';
  }

  void _changeType(ShoppingType? type) {
    if (type == null) return;
    _type = type;
  }

  void _onSave() {
    if (_viewModel.saving.running ||
        _viewModel.update.running ||
        _formKey.currentState == null ||
        !_formKey.currentState!.validate()) {
      return;
    }

    final dto = ShoppingDto.create(
      name: _namecontroller.text,
      description: _descriptionController.text,
      type: _type,
    );

    if (!_isEditing) {
      _viewModel.saving.execute(dto);
      return;
    }

    final shopping = ShoppingModel.fromDto(_shoppingId!, dto);
    _viewModel.update.execute(shopping);
  }

  void _onSaved() {
    if (_viewModel.saving.running || _viewModel.update.running) return;

    final result = _isEditing
        ? _viewModel.update.result!
        : _viewModel.saving.result!;

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
          message:
              'Ocorreu um erro ao ${_isEditing ? 'editar' : 'criar'} a compra.',
        );
        break;
    }
  }

  void _initializeForm() {
    if (widget.shopping == null) return;
    _isEditing = true;
    final shopping = widget.shopping!;

    _namecontroller.text = shopping.name;
    _descriptionController.text = shopping.description;
    _type = shopping.type;
    _shoppingId = shopping.id;

    setState(() {});
  }
}
