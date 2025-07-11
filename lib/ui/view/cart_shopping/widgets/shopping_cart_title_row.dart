import 'package:flutter/material.dart';

import '/ui/core/themes/fonts.dart';

class ShoppingCartTitleRow extends StatelessWidget {
  const ShoppingCartTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fontStyle = AppFontsStyle.of(context);

    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Text(
            'Item',
            style: fontStyle.bodyGreateTextStyle,
          ),
        ),
        SizedBox(
          width: 50,
          child: Center(
            child: Text(
              'Qt',
              style: fontStyle.bodyGreateTextStyle,
            ),
          ),
        ),
        SizedBox(
          width: 50,
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'Preço',
              style: fontStyle.bodyGreateTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
