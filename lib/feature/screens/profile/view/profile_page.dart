import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/core/constants/enums/enums.dart';
import 'package:siparis_takip_sistemi_pro/product/src/button/loading_button.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/getit/product_items.dart';

import '../../../../product/utils/router/route_manager.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../../../authentication/login/bloc/login_bloc.dart';
import '../../../authentication/login/service/login_service.dart';
import '../bloc/profile_page_bloc.dart';
import 'src/index.dart';

part 'src/_profile_page_logout_button.dart';
part 'src/_change_currency_symbol_field.dart';

@RoutePage()
final class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (context) => ProfilePageBloc(ProductItems.profileService)
          ..add(
            const FetchUserDetailsEvent(),
          ),
        child: const Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileDetailField(),
                    ChooseThemeField(),
                    ChangeLanguageField(),
                    _ChangeCurrencySymbolField(),
                    _ProfilePageLogoutButton(),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
