import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/translations/locale_keys.g.dart';

final class FailedLoadDataText extends StatelessWidget {
  const FailedLoadDataText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LocaleKeys.errors_failedLoadData.tr()),
    );
  }
}
