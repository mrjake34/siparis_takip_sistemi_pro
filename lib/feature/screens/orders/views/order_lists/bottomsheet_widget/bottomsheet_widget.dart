import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/orders/model/order_model.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

import '../../../../../../gen/index.dart';

// ignore: must_be_immutable
class OrderListBottomSheetWidget extends StatelessWidget {
  const OrderListBottomSheetWidget({
    required this.order,
    super.key,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UpdateStatusToWaiting(
            order: order,
          ),
          UpdateStatusToProcess(
            order: order,
          ),
          UpdateStatusToDistribution(
            order: order,
          ),
          UpdateStatusToCompleted(
            order: order,
          ),
          EditButton(
            order: order,
          ),
          RemoveButton(
            order: order,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class UpdateStatusToWaiting extends StatelessWidget {
  const UpdateStatusToWaiting({
    required this.order,
    super.key,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.order_inLine.tr(),
              style: const TextStyle(color: ColorName.orderPendingColor),
            ),
          ),
        ),
      ],
    );
  }
}

class UpdateStatusToProcess extends StatelessWidget {
  const UpdateStatusToProcess({
    required this.order,
    super.key,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.order_inProcess.tr(),
              style: const TextStyle(color: ColorName.orderInProcessColor),
            ),
          ),
        ),
      ],
    );
  }
}

class UpdateStatusToDistribution extends StatelessWidget {
  const UpdateStatusToDistribution({required this.order, super.key});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.order_onTheWay.tr(),
              style: const TextStyle(color: ColorName.orderOnTheWayColor),
            ),
          ),
        ),
      ],
    );
  }
}

class UpdateStatusToCompleted extends StatelessWidget {
  const UpdateStatusToCompleted({
    required this.order,
    super.key,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.order_isDone.tr(),
              style: const TextStyle(color: ColorName.orderIsDoneColor),
            ),
          ),
        ),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({required this.order, super.key});

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.mainText_edit.tr(),
              style: const TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    required this.order,
    super.key,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.mainText_remove.tr(),
              style: const TextStyle(color: ColorName.removeColor),
            ),
          ),
        ),
      ],
    );
  }
}
