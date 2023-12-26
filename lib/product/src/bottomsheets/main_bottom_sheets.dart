import 'package:flutter/material.dart';
import '../../core/constants/size/sizes.dart';

final class CustomBottomSheets {
  CustomBottomSheets._();
  static Future<T?> openBottomSheet<T>(
    BuildContext context,
    Widget widget,
  ) async {
    final pageWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.pagePadding)),
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

  static Future<T?> openBottomSheetNoScrollable<T>(
    BuildContext context,
    Widget widget,
  ) async {
    final pageWidth = MediaQuery.of(context).size.width;
    return showModalBottomSheet(
      constraints: BoxConstraints(
        minWidth: pageWidth,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.pagePadding)),
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
