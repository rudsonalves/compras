import 'dart:io';

import 'package:flutter/material.dart';

import '../buttons/button_signature.dart';
import '/ui/core/themes/dimens.dart';
import '/ui/core/themes/fonts.dart';

class BottomSheetDialog<T> extends StatefulWidget {
  final String title;
  final List<Widget> body;
  final void Function()? onClosing;
  final List<ButtonSignature<T>>? buttons;

  const BottomSheetDialog({
    super.key,
    required this.title,
    required this.body,
    this.onClosing,
    this.buttons,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required List<Widget> body,
    void Function()? onClosing,
    List<ButtonSignature<T>>? buttons,
  }) async {
    final dimens = Dimens.of(context);
    final height = MediaQuery.of(context).size.height;

    return await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(dimens.radius),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: height * .95,
      ),
      builder: (context) => BottomSheetDialog<T>(
        title: title,
        body: body,
        onClosing: onClosing,
        buttons: buttons,
      ),
    );
  }

  @override
  State<BottomSheetDialog<T>> createState() => _BottomSheetDialogState<T>();
}

class _BottomSheetDialogState<T> extends State<BottomSheetDialog<T>> {
  List<Widget> buttonList() {
    final fonts = AppFontsStyle.of(context);

    return widget.buttons!
        .map(
          (button) => TextButton.icon(
            onPressed: () {
              final result = button.onPressed?.call();

              if (result != null) {
                Navigator.pop<T>(context, result);
              }
            },
            label: Text(
              button.label,
              style: Platform.isAndroid ? fonts.bodyTextStyle : null,
            ),
            icon: button.iconData != null ? Icon(button.iconData) : null,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final dimens = Dimens.of(context);
    final fonts = AppFontsStyle.of(context);

    return BottomSheet(
      onClosing: widget.onClosing ?? () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.title,
                style: fonts.bodyLargeTextStyle.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: dimens.spacingVertical / 2,
              ),
              child: Column(
                spacing: dimens.spacingVertical,
                children: widget.body,
              ),
            ),
            const Divider(),
            if (widget.buttons != null)
              Center(child: Wrap(children: buttonList())),
          ],
        ),
      ),
    );
  }
}
