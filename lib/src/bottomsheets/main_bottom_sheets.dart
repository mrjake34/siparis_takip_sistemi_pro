import 'package:flutter/material.dart';
import '../../core/constants/size/sizes.dart';

class MainBottomSheets {
  Future openBottomSheet(BuildContext context, Widget widget) async {
    double pageWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(pagePadding))),
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

  Future openBottomSheetNoScrollable(
      BuildContext context, Widget widget) async {
    double pageWidth = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(pagePadding))),
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