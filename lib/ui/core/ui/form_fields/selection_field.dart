import 'package:compras/ui/core/ui/form_fields/basic_form_field.dart';
import 'package:flutter/material.dart';

class SelectionField extends StatelessWidget {
  final String labelText;
  final List<String> suggestions;
  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  SelectionField({
    super.key,
    required this.labelText,
    required this.suggestions,
    TextEditingController? controller,
    this.hintText,
    this.validator,
    this.onChanged,
    FocusNode? focusNode,
    this.nextFocusNode,
  }) : controller = controller ?? TextEditingController(),
       focusNode = focusNode ?? FocusNode();

  @override
  Widget build(BuildContext context) {
    return BasicFormField(
      controller: controller,
      focusNode: focusNode,
      labelText: labelText,
      hintText: hintText,
      readOnly: true,
      suffixIcon: const Icon(Icons.arrow_drop_down),
      validator: (value) {
        if (value == null || !suggestions.contains(value)) {
          return 'Selecione um valor válido';
        }
        if (validator != null) return validator!(value);
        return null;
      },
      onTap: () => _showOptions(context),
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
    );
  }

  void _showOptions(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        position.dy,
      ),
      items: suggestions
          .map(
            (opt) => PopupMenuItem(
              value: opt,
              child: Text(opt),
            ),
          )
          .toList(),
    ).then((selected) {
      if (selected != null) {
        controller.text = selected;
        onChanged?.call(selected);
        if (nextFocusNode != null) {
          if (!context.mounted) return;
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
      }
    });
  }
}
