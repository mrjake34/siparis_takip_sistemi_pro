import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';

class MainBottomSheets {
  Future<dynamic> openBottomSheet(BuildContext context, Widget widget) async {
    final pageWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(pagePadding)),
      ),
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  Future<dynamic> openBottomSheetNoScrollable(
    BuildContext context,
    Widget widget,
  ) async {
    final pageWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(pagePadding)),
      ),
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
