import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class CustomAutoSizeNumber extends StatelessWidget {
  final String data;
  final Color? textColor;
  const CustomAutoSizeNumber({super.key, required this.data, this.textColor});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(data,
        maxLines: 1,
        minFontSize: 18,
        textAlign: TextAlign.start,
        wrapWords: false,
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor));
  }
}
