import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/translations/locale_keys.g.dart';

class EditPageButtonField extends StatelessWidget {
  const EditPageButtonField({
    required this.editingStatus,
    required this.isEditingFunction,
    required this.saveFunction,
    required this.cancelFunction,
    super.key,
  });
  final bool editingStatus;
  final void Function() isEditingFunction;
  final void Function() saveFunction;
  final void Function() cancelFunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Builder(
          builder: (context) {
            if (editingStatus == true) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: isEditingFunction,
                child: Text(LocaleKeys.mainText_edit.tr()),
              );
            } else {
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: saveFunction,
                    child: Text(LocaleKeys.mainText_save.tr()),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: cancelFunction,
                    child: Text(LocaleKeys.mainText_cancel.tr()),
                  ),
                ],
              );
            }
          },
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
