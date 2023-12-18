// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/colors/colors.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/cards_more_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/service/courier_service.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/view/edit_courier.dart';

import '../../../../product/core/constants/navigation/navigation_constants.dart';

class CourierListPage extends StatefulWidget {
  const CourierListPage({super.key});

  @override
  State<CourierListPage> createState() => _CourierListPageState();
}

class _CourierListPageState extends State<CourierListPage> with BaseModelView {
  @override
  Widget build(BuildContext context) {
    context.read<CourierBloc>().add(const CourierEvent());
    return PageBuilder(appColors: appColors);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.appColors,
    super.key,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          Flexible(child: CourierListBuilder(appColors: appColors)),
        ],
      ),
    );
  }
}

class LinearField extends StatelessWidget {
  const LinearField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierBloc, CourierState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.isLoading) {
          return LinearProgressIndicator(
            color: AppColors.instance.alternativeButtonColor,
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class CourierListBuilder extends StatelessWidget {
  const CourierListBuilder({
    required this.appColors,
    super.key,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierBloc, CourierState>(
      builder: (context, state) {
        if (state.courierList != null) {
          return ListView.builder(
            padding: const EdgeInsets.all(pagePadding),
            itemCount: state.courierList?.couriers.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final couriers = state.courierList?.couriers[index];
              return ListCard(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CourierCardCourierDetailField(couriers: couriers),
                    ),
                    Expanded(
                      child: MoreButton(couriers: couriers),
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state.courierList == null) {
          return Center(
            child: Text(LocaleKeys.mainText_listEmpty.tr()),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({
    required this.couriers,
    super.key,
  });

  final Courier? couriers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => CardMoreButton.openMenu(
        context: context,
        path: NavigationConstants.courierEditPage,
        id: couriers?.id ?? '',
        function: () {
          CourierService().deleteCourier(couriers?.id ?? '').whenComplete(
                () => Navigator.pop(context),
              );
        },
        offset: details.globalPosition,
      ),
      child: const Icon(
        Icons.more_vert,
      ),
    );
  }
}

class CourierCardCourierDetailField extends StatelessWidget {
  const CourierCardCourierDetailField({
    required this.couriers,
    super.key,
  });

  final Courier? couriers;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            couriers?.name ?? '',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text(couriers?.email ?? ''),
          subtitle: Text(couriers?.phone ?? ''),
        ),
      ],
    );
  }
}