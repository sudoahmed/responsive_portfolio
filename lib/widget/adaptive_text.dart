import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AdaptiveText extends StatelessWidget {
  const AdaptiveText(
      {Key? key, required this.text, required this.style, this.textAlign})
      : super(key: key);

  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SelectableText(
            text,
            style: style,
            textAlign: textAlign,
          )
        : Text(
            text,
            style: style,
            textAlign: textAlign,
          );
  }
}
