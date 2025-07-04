import 'package:compras/ui/core/ui/form_fields/basic_form_field.dart';
import 'package:flutter/material.dart';

class SugestionTextField extends StatefulWidget {
  final String? labelText;
  final List<String> sugestions;
  final String? initialValue;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool fullBorder;
  final int? maxLines;
  final int? minLines;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? errorText;
  final String? suffixText;
  final String? prefixText;
  final Widget? prefixIcon;

  const SugestionTextField({
    super.key,
    this.labelText,
    required this.sugestions,
    this.initialValue,
    this.labelStyle,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.fullBorder = false,
    this.maxLines = 1,
    this.minLines,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.readOnly = false,
    this.suffixIcon,
    this.errorText,
    this.textCapitalization,
    this.suffixText,
    this.prefixText,
    this.prefixIcon,
  });

  @override
  State<SugestionTextField> createState() => _SugestionTextFieldState();
}

class _SugestionTextFieldState extends State<SugestionTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  List<String> _filteredSuggestions = [];

  bool _haveFocus = true;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_filterSuggestions);

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_filterSuggestions);
    if (widget.controller == null) {
      _controller.dispose();
    }

    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: widget.prefixIcon!,
              ),
            Expanded(
              child: BasicFormField(
                controller: widget.controller,
                initialValue: widget.initialValue,
                validator: widget.validator,
                focusNode: _focusNode,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction ?? TextInputAction.next,
                minLines: widget.minLines,
                maxLines: widget.maxLines,
                readOnly: widget.readOnly,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.none,

                labelText: widget.labelText,
                labelStyle: widget.labelStyle,
                hintText: widget.hintText,
                errorText: widget.errorText,
                suffixIcon: widget.suffixIcon,
                suffixText: widget.suffixText,
                prefixText: widget.prefixText,
                border: widget.fullBorder
                    ? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )
                    : null,
                floatingLabelBehavior: widget.floatingLabelBehavior,

                onChanged: widget.onChanged,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(widget.nextFocusNode);
                  if (widget.onFieldSubmitted != null) {
                    widget.onFieldSubmitted!(value);
                  }
                },
              ),
            ),
          ],
        ),
        if (_filteredSuggestions.isNotEmpty && _haveFocus)
          Container(
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _filteredSuggestions
                  .map(
                    (suggestion) => InkWell(
                      onTap: () => _setSugestion(suggestion),
                      child: Chip(label: Text(suggestion)),
                    ),
                  )
                  .toList(),
            ),
          ),
      ],
    );
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      setState(() {
        _haveFocus = false;
      });
    } else {
      _haveFocus = true;
    }
  }

  void _filterSuggestions() {
    final query = _controller.text.toLowerCase();
    // if (query.length >= 0) {
    setState(() {
      _filteredSuggestions = widget.sugestions
          .where((type) => type.toLowerCase().contains(query))
          .toList();
    });
  }

  void _setSugestion(String suggestion) {
    _controller.text = suggestion;
    if (widget.onChanged != null) {
      widget.onChanged!(suggestion);
    }
    FocusScope.of(context).requestFocus(widget.nextFocusNode);
  }
}
