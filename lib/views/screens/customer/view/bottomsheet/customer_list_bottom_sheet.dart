import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/service/customer_service.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/customer/view/edit_customer.dart';

class CustomerListBottomSheetWidget extends StatelessWidget {
  const CustomerListBottomSheetWidget({
    required this.appColors,
    required this.id,
    super.key,
  });
  final String? id;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    pageRouterEditCustomer(),
                  );
                },
                child: Text(
                  LocaleKeys.mainText_edit.tr(),
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  openDialog(context);
                },
                child: Text(
                  LocaleKeys.mainText_remove.tr(),
                  style: TextStyle(color: appColors.removeColor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }

  Future<dynamic> openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            LocaleKeys.mainText_remove.tr(),
            style: const TextStyle(fontSize: 15),
          ),
          content: Text(
            LocaleKeys.alerts_customerRemoveFromCustomerList.tr(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(LocaleKeys.mainText_cancel.tr()),
            ),
            TextButton(
              onPressed: () {
                CustomerService().deleteCustomer(id ?? '');
              },
              child: Text(LocaleKeys.mainText_confirm.tr()),
            ),
          ],
        );
      },
    );
  }

  MaterialPageRoute<dynamic> pageRouterEditCustomer() {
    return MaterialPageRoute(
      builder: (context) => EditCustomer(
        id: id ?? '',
      ),
    );
  }
}
