import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class CustomAutoSizeText extends StatelessWidget {
  const CustomAutoSizeText({required this.data, super.key, this.textColor});
  final String data;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      data,
      maxLines: 2,
      maxFontSize: 30,
      textAlign: TextAlign.start,
      wrapWords: false,
      style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
    );
  }
}
