import 'package:flutter/material.dart';

import '/ui/core/ui/form_fields/basic_form_field.dart';

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
    showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final TextEditingController searchController = TextEditingController();
        List<String> filtered = List.from(suggestions);

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Pesquisar $labelText',
                      ),
                      onChanged: (value) {
                        setState(() {
                          filtered = suggestions
                              .where(
                                (s) => s.toLowerCase().contains(
                                  value.toLowerCase(),
                                ),
                              )
                              .toList();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final option = filtered[index];
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            Navigator.pop(context, option);
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
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
