import 'package:compras/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class BasicFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final InputBorder? border;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final IconData? suffixIconData;
  final Widget? suffixIcon;
  final IconData? prefixIconData;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? suffixText;
  final Color? iconColor;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final TextAlign textAlign;
  final String? errorText;
  final TextStyle? labelStyle;
  final void Function(String)? onFieldSubmitted;
  final String? initialValue;

  const BasicFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.border,
    this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.suffixIconData,
    this.suffixIcon,
    this.prefixIconData,
    this.prefixIcon,
    this.suffixText,
    this.prefixText,
    this.iconColor,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.nextFocusNode,
    this.onEditingComplete,
    this.validator,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.textAlign = TextAlign.start,
    this.errorText,
    this.labelStyle,
    this.onFieldSubmitted,
    this.initialValue,
  });

  @override
  State<BasicFormField> createState() => _BasicFormFieldState();
}

class _BasicFormFieldState extends State<BasicFormField> {
  AutovalidateMode? autoValidate;

  @override
  void initState() {
    widget.controller?.addListener(_checkValidation);
    super.initState();
  }

  void _checkValidation() {
    if (autoValidate != null || widget.controller!.text.isEmpty) return;

    setState(() {
      autoValidate = AutovalidateMode.always;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Dimens dimens = Dimens.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    // final border = widget.border;
    //  ??
    final border =
        widget.border ??
        OutlineInputBorder(
          borderRadius: dimens.borderRadius,
          borderSide: BorderSide(color: colorScheme.onPrimary),
        );

    final suffixIcon =
        widget.suffixIcon ??
        (widget.suffixIconData != null
            ? Icon(
                widget.suffixIconData,
                color: widget.iconColor ?? colorScheme.primary,
              )
            : null);

    final prefixIcon =
        widget.prefixIcon ??
        (widget.prefixIconData != null
            ? Icon(
                widget.prefixIconData,
                color: widget.iconColor ?? colorScheme.primary,
              )
            : null);

    return TextFormField(
      autovalidateMode: autoValidate,
      controller: widget.controller,
      initialValue: widget.initialValue,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      validator: widget.validator,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      textAlign: widget.textAlign,
      onFieldSubmitted: (value) {
        if (widget.nextFocusNode != null) {
          FocusScope.of(context).requestFocus(widget.nextFocusNode);
        }
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },
      onTap: widget.onTap,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        border: border,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: widget.prefixText,
        suffixText: widget.suffixText,
        errorText: widget.errorText,
        labelStyle: widget.labelStyle,
      ),
    );
  }
}
