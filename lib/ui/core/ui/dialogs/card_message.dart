import 'package:flutter/material.dart';

import '/ui/core/themes/dimens.dart';
import '/ui/core/themes/fonts.dart';
import '/ui/core/ui/texts/parse_rich_text.dart';

class CardMessage extends StatelessWidget {
  final String title;
  final List<String> body;

  const CardMessage({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appFont = AppFontsStyle.of(context);
    final dimens = Dimens.of(context);

    final texts = body.map((text) => parseRichText(context, text)).toList();
    return Card(
      color: colorScheme.surfaceContainerHighest,
      margin: EdgeInsets.symmetric(horizontal: dimens.paddingScreenHorizontal),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: dimens.paddingScreenVertical,
          horizontal: dimens.paddingScreenHorizontal,
        ),
        child: Column(
          spacing: 6,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text(title, style: appFont.bodyLargeTextStyle)),
            const Divider(),
            ...texts,
          ],
        ),
      ),
    );
  }
}
