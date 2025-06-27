import 'package:flutter/widgets.dart';

class ButtonSignature<T> {
  final String label;
  final IconData? iconData;
  final T Function()? onPressed;

  ButtonSignature({
    required this.label,
    this.iconData,
    required this.onPressed,
  });
}
