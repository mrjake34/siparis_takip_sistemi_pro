import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class CustomAutoSizeText extends StatelessWidget {
  final String data;
  final Color? textColor;
  const CustomAutoSizeText({super.key, required this.data, this.textColor});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(data,
        maxLines: 2,
        minFontSize: 12,
        maxFontSize: 30,
        textAlign: TextAlign.start,
        wrapWords: false,
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor));
  }
}
