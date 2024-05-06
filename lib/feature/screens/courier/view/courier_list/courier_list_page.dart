// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/courier/model/courier_model.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/home_page/view/home_page.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/cards_more_button.dart';
import 'package:siparis_takip_sistemi_pro/product/src/cards/list_card.dart';

import '../../../../../gen/index.dart';
import '../../../../../product/src/text/failed_load_data_text.dart';

part 'courier_list_page_mixin.dart';

@RoutePage()
final class CourierListPage extends StatefulWidget {
  const CourierListPage({super.key});

  @override
  State<CourierListPage> createState() => _CourierListPageState();
}

class _CourierListPageState extends State<CourierListPage>
    with CourierListPageMixin {
  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      body: Column(
        children: [
          LinearField(),
          Flexible(child: CourierListBuilder()),
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
          return const LinearProgressIndicator(
            color: ColorName.alternativeButtonColor,
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierBloc, CourierState>(
      builder: (context, state) {
        final List<CourierModel?>? courierList = state.courierList;
        if (courierList == null) return const FailedLoadDataText();
        return ListView.builder(
          itemCount: courierList.length,
          itemBuilder: (BuildContext context, int index) {
            final couriers = courierList[index];
            if (couriers == null) return const SizedBox();
            return ListCard(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CourierCardCourierDetailField(courier: couriers),
                  ),
                  Expanded(
                    child: MoreButton(couriers: couriers),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({
    required this.couriers,
    super.key,
  });

  final CourierModel couriers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => CardMoreButton.openMenu<void>(
        context: context,
        id: couriers.id ?? '',
        function: () {
          context.read<CourierBloc>().add(
                CourierDeleteEvent(couriers),
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
    required this.courier,
    super.key,
  });

  final CourierModel courier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            courier.name ?? '',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text(courier.email ?? ''),
          subtitle: Text(courier.phone ?? ''),
        ),
      ],
    );
  }
}
