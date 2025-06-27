import 'package:flutter/material.dart';

import '/ui/core/ui/form_fields/widgets/toggle_buttons_text.dart';
import '/ui/core/themes/dimens.dart';

enum EnumFormLayout { row, wrap, scroll }

class EnumFormField<T extends Enum> extends FormField<T> {
  final List<T> values;
  final String? title;
  final ValueChanged<T?>? onChanged;
  final String Function(T value) labelBuilder;
  final EnumFormLayout layout;
  EnumFormField({
    super.key,
    super.onSaved,
    super.validator,
    AutovalidateMode super.autovalidateMode =
        AutovalidateMode.onUserInteraction,
    this.title,
    required this.values,
    required this.labelBuilder,
    this.layout = EnumFormLayout.wrap,
    this.onChanged,
    super.initialValue,
  }) : super(
         builder: (state) {
           final dimens = Dimens.of(state.context);
           final colorScheme = Theme.of(state.context).colorScheme;

           return Center(
             child: Column(
               children: [
                 if (title != null) Text(title),
                 if (layout == EnumFormLayout.wrap)
                   Wrap(
                     alignment: WrapAlignment.center,
                     spacing: dimens.spacingHorizontal,
                     children: List.generate(values.length, (index) {
                       final value = values[index];
                       return ChoiceChip(
                         label: Text(labelBuilder(value)),
                         selected: state.value == value,
                         onSelected: (_) {
                           state.didChange(value);
                           onChanged?.call(value);
                         },
                       );
                     }),
                   ),
                 if (layout == EnumFormLayout.row)
                   SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: ToggleButtons(
                       borderRadius: dimens.borderRadius,
                       borderWidth: 2,
                       isSelected: values.map((e) => e == state.value).toList(),
                       onPressed: (index) {
                         final newValue = values[index];
                         state.didChange(newValue);
                         onChanged?.call(newValue);
                       },
                       children: values
                           .map(
                             (e) => ToggleButtonsText(
                               selected: state.value,
                               text: labelBuilder(e),
                               buttonState: e,
                             ),
                           )
                           .toList(),
                     ),
                   ),
                 if (state.hasError)
                   Padding(
                     padding: const EdgeInsets.only(top: 8),
                     child: Text(
                       state.errorText!,
                       style: TextStyle(color: colorScheme.error, fontSize: 12),
                     ),
                   ),
               ],
             ),
           );
         },
       );

  @override
  FormFieldState<T> createState() => _EnumFormFieldState<T>();
}

class _EnumFormFieldState<T> extends FormFieldState<T> {
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      setValue(widget.initialValue);
    }
  }

  @override
  void didUpdateWidget(covariant FormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }
}
