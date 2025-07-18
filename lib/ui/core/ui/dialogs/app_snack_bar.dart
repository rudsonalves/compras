import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '/ui/core/themes/dimens.dart';
import '/ui/core/themes/fonts.dart';

showSnackError(BuildContext context, String message) {
  AppSnackBar.showBottom(
    context,
    title: 'Erro!',
    iconTitle: Symbols.error_rounded,
    message: message,
    duration: const Duration(seconds: 2),
    isError: true,
  );
}

showSnackSuccess(
  BuildContext context, {
  required String message,
  IconData? iconTitle = Symbols.check_rounded,
  Duration duration = const Duration(seconds: 2),
}) {
  AppSnackBar.showBottom(
    context,
    title: 'Sucesso!',
    iconTitle: iconTitle,
    message: message,
    duration: duration,
    isError: false,
  );
}

class AppSnackBar {
  static void showBottom(
    BuildContext context, {
    String? title,
    IconData? iconTitle,
    required String message,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onActionPressed,
    VoidCallback? onClosed,
    bool isError = false,
  }) {
    final scaffoldMessager = ScaffoldMessenger.of(context);

    // Remove any existing Snackbar
    scaffoldMessager.clearSnackBars();

    // Create the SnackBar
    final snackBar = _createSnackBar(
      context,
      title: title,
      iconTitle: iconTitle,
      message: message,
      duration: duration,
      actionLabel: actionLabel,
      onActionPressed: onActionPressed,
      isError: isError,
    );

    final scaffoldController = scaffoldMessager.showSnackBar(snackBar);

    scaffoldController.closed.then((_) {
      if (onClosed != null) onClosed();
    });

    return;
  }

  static SnackBar _createSnackBar(
    BuildContext context, {
    String? title,
    IconData? iconTitle,
    required String message,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onActionPressed,
    required bool isError,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = Dimens.of(context).radius;
    final textStyle = AppFontsStyle.of(context);

    return SnackBar(
      duration: duration,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      elevation: 5,
      backgroundColor: isError
          ? colorScheme.onErrorContainer
          : colorScheme.onPrimaryContainer,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconTitle != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      iconTitle,
                      color: isError ? Colors.red : Colors.green,
                    ),
                  ),
                Text(title, style: textStyle.displayTextStyle),
              ],
            ),
          if (title != null) const Divider(),

          Text(message, style: textStyle.bodyTextStyle),
        ],
      ),
      action: (actionLabel != null && onActionPressed != null)
          ? SnackBarAction(
              label: actionLabel,
              onPressed: onActionPressed,
              textColor: colorScheme.onPrimary,
            )
          : null,
    );
  }
}
