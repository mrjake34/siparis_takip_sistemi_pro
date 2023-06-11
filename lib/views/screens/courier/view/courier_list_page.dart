import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/core/base/models/base_model_view.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';
import 'package:siparis_takip_sistemi_pro/core/init/translation/locale_keys.g.dart';
import 'package:siparis_takip_sistemi_pro/src/bottomsheets/main_bottom_sheets.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/bloc/courier_bloc.dart';
import 'package:siparis_takip_sistemi_pro/views/screens/courier/view/bottomsheet/courier_bottom_sheet.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../model/courier.dart';

class CourierListPage extends StatefulWidget {
  const CourierListPage({Key? key}) : super(key: key);

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
    super.key,
    required this.appColors,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.courier_courierList.tr(),
        ),
      ),
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
    super.key,
    required this.appColors,
  });

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierBloc, CourierState>(
      builder: (context, state) {
        if (state.courierList != null) {
          return ListView.builder(
            padding: const EdgeInsets.all(pagePadding),
            itemCount: state.courierList?.courier?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              Courier? courier = state.courierList?.courier?[index];
              return Card(
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CourierCardCourierDetailField(courier: courier),
                    ),
                    Expanded(
                      flex: 1,
                      child: CourierCardMoreButtonField(
                          appColors: appColors, courier: courier),
                    )
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

class CourierCardCourierDetailField extends StatelessWidget {
  const CourierCardCourierDetailField({
    super.key,
    required this.courier,
  });

  final Courier? courier;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 0),
          child: Text(
            courier?.name ?? "",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          title: Text(courier?.email ?? ""),
          subtitle: Text(courier?.phone ?? ""),
        ),
      ],
    );
  }
}

class CourierCardMoreButtonField extends StatelessWidget {
  const CourierCardMoreButtonField({
    super.key,
    required this.appColors,
    required this.courier,
  });

  final AppColors appColors;
  final Courier? courier;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MainBottomSheets().openBottomSheet(
              context,
              CourierBottomSheet(
                appColors: appColors,
                id: courier?.id,
                name: courier?.name,
              ));
        },
        child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: const Icon(Icons.more_vert)));
  }
}
