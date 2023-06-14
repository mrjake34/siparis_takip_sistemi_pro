import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/base/models/base_model_view.dart';
import '../../../../../../core/constants/colors/colors.dart';
import '../../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../../core/init/navigation/navigation_service.dart';
import '../../../bloc/add_order_bloc/orders_bloc.dart';
import '../../../../../../core/init/translation/locale_keys.g.dart';
import '../../../model/order.dart';
import '../../../service/order_service.dart';

// ignore: must_be_immutable
class OrderListBottomSheetWidget extends StatelessWidget with BaseModelView {
  OrderListBottomSheetWidget({super.key, this.order});
  final Order? order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UpdateStatusToWaiting(
            orderId: order?.id,
            appColors: appColors,
          ),
          UpdateStatusToProcess(
            orderId: order?.id,
            appColors: appColors,
          ),
          UpdateStatusToDistribution(
            orderId: order?.id,
            appColors: appColors,
          ),
          UpdateStatusToCompleted(
            orderId: order?.id,
            appColors: appColors,
          ),
          EditButton(
            order: order,
            appColors: appColors,
          ),
          RemoveButton(
            navService: navService,
            orderId: order?.id,
            appColors: appColors,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class UpdateStatusToWaiting extends StatelessWidget {
  const UpdateStatusToWaiting({super.key, required this.orderId, required this.appColors});

  final String? orderId;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextButton(
              onPressed: () {
                OrderService().patchOrder(orderId ?? "", "orderStatus", "waiting");
              },
              child: Text(
                LocaleKeys.order_inLine.tr(),
                style: TextStyle(color: appColors.orderPendingColor),
              )),
        ),
      ],
    );
  }
}

class UpdateStatusToProcess extends StatelessWidget {
  const UpdateStatusToProcess({super.key, required this.orderId, required this.appColors});

  final String? orderId;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextButton(
              onPressed: () {
                OrderService().patchOrder(orderId ?? "", "orderStatus", "inProcess");
              },
              child: Text(
                LocaleKeys.order_inProcess.tr(),
                style: TextStyle(color: appColors.orderInProcessColor),
              )),
        ),
      ],
    );
  }
}

class UpdateStatusToDistribution extends StatelessWidget {
  const UpdateStatusToDistribution({super.key, required this.orderId, required this.appColors});

  final String? orderId;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextButton(
              onPressed: () {
                OrderService().patchOrder(orderId ?? "", "orderStatus", "inDistribution");
              },
              child: Text(
                LocaleKeys.order_onTheWay.tr(),
                style: TextStyle(color: appColors.orderOnTheWayColor),
              )),
        ),
      ],
    );
  }
}

class UpdateStatusToCompleted extends StatelessWidget {
  const UpdateStatusToCompleted({super.key, required this.orderId, required this.appColors});

  final String? orderId;

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              OrderService().patchOrder(orderId ?? "", "orderStatus", "completed");
            },
            child: Text(
              LocaleKeys.order_isDone.tr(),
              style: TextStyle(color: appColors.orderIsDoneColor),
            ),
          ),
        ),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({super.key, required this.order, required this.appColors});

  final Order? order;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextButton(
              onPressed: () {
                context.read<OrdersBloc>().add(ChooseAnOrder(order: order));
                NavigationService.instance.navigateToPage(path: NavigationConstants.orderEditPage);
              },
              child: Text(
                LocaleKeys.mainText_edit.tr(),
                style: const TextStyle(color: Colors.blue),
              )),
        ),
      ],
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key, required this.navService, required this.orderId, required this.appColors});

  final NavigationService navService;
  final String? orderId;
  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                OpenDialog(context);
              },
              child: Text(
                LocaleKeys.mainText_remove.tr(),
                style: TextStyle(color: appColors.removeColor),
              )),
        ),
      ],
    );
  }

  Future<dynamic> OpenDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              LocaleKeys.mainText_remove.tr(),
              style: const TextStyle(fontSize: 15),
            ),
            content: RichText(
              text: TextSpan(text: LocaleKeys.alerts_orderRemove.tr(), style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    navService.navigateToBack();
                  },
                  child: Text(LocaleKeys.mainText_cancel.tr())),
              TextButton(
                  onPressed: () {
                    OrderService().deleteOrder(orderId ?? "");
                  },
                  child: Text(LocaleKeys.mainText_confirm.tr())),
            ],
          );
        });
  }
}
