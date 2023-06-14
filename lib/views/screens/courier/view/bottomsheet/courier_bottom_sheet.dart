import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/service/courier_service.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/view/edit_courier.dart';

class CourierBottomSheet extends StatelessWidget {
  const CourierBottomSheet({
    required this.appColors,
    super.key,
    this.id,
    this.name,
  });

  final AppColors appColors;
  final String? id;
  final String? name;

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
                  //CourierService().patchCourier(key, value);
                  Navigator.pop(context);
                  Navigator.push(context, pageRouterEditCourier());
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
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          LocaleKeys.mainText_remove.tr(),
                          style: const TextStyle(fontSize: 15),
                        ),
                        content: RichText(
                          text: TextSpan(
                            text: LocaleKeys.alerts_courierRemove.tr(),
                            children: [
                              TextSpan(
                                text: name,
                              ),
                              TextSpan(
                                text: LocaleKeys
                                    .alerts_courierRemoveFromCustomerList
                                    .tr(),
                              )
                            ],
                          ),
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
                              CourierService()
                                  .deleteCourier(id ?? '', name ?? '')
                                  .whenComplete(
                                    () => Navigator.pop(context),
                                  );
                            },
                            child: Text(LocaleKeys.mainText_confirm.tr()),
                          ),
                        ],
                      );
                    },
                  );
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

  MaterialPageRoute<dynamic> pageRouterEditCourier() {
    return MaterialPageRoute(
      builder: (context) => EditCourier(
        id: id ?? '',
      ),
    );
  }
}
