import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors/colors.dart';
import '../../../../../core/init/translation/locale_keys.g.dart';
import '../../service/customer_service.dart';
import '../edit_customer.dart';

class CustomerListBottomSheetWidget extends StatelessWidget {
  const CustomerListBottomSheetWidget({
    super.key,
    required this.appColors,
    required this.id
  });
  final String? id;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditCustomer(
                                  id: id ?? "",
                                )));
                  },
                  child: Text(
                    LocaleKeys.mainText_edit.tr(),
                    style: const TextStyle(color: Colors.blue),
                  )),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              LocaleKeys.mainText_remove.tr(),
                              style: const TextStyle(fontSize: 15),
                            ),
                            content: Text(LocaleKeys
                                .alerts_customerRemoveFromCustomerList
                                .tr()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(LocaleKeys.mainText_cancel.tr())),
                              TextButton(
                                  onPressed: () {
                                    CustomerService().deleteCustomer(id ?? "");
                                  },
                                  child:
                                      Text(LocaleKeys.mainText_confirm.tr())),
                            ],
                          );
                        });
                  },
                  child: Text(
                    LocaleKeys.mainText_remove.tr(),
                    style: TextStyle(color: appColors.removeColor),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
