import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/provider/theme/theme_cubit.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/localization/localization_manager.dart';

import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/theme/theme_service.dart';
import '../../../../product/utils/getit/product_items.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../../../authentication/login/bloc/login_bloc.dart';
import '../bloc/profile_page_bloc.dart';
import '../model/user.dart';

part 'profile_detail_field.dart';
part 'failed_load_data.dart';
part 'user_profile_card_expiration_data.dart';
part 'user_profile_card_name.dart';
part 'user_profile_card_phone.dart';
part 'user_profile_card_shopname.dart';
part 'user_profile_card_email.dart';
part 'page_fields.dart';
part 'change_language_field.dart';
part 'choose_theme_field.dart';

@RoutePage()
final class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: BlocProvider(
        create: (context) => ProfilePageBloc()
          ..add(
            FetchUserDetailsEvent(
              userId: context.read<LoginBloc>().state.model?.id,
              cookie: context.read<LoginBloc>().state.cookie,
            ),
          ),
        child: const Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _ProfileDetailField(),
                    _ChooseThemeField(),
                    _ChangeLanguageField(),
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

final class _ChangeCurrencySymbolField extends StatelessWidget {
  const _ChangeCurrencySymbolField();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(Icons.keyboard_double_arrow_down),
      title: Text(LocaleKeys.mainText_changeCurrencySymbol.tr()),
      children: [
        Wrap(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.turkishLiraSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.euroSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.dollarSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.sterlingSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.rubleSign),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.manatSign),
            ),
          ],
        ),
      ],
    );
  }
}

final class _ProfilePageLogoutButton extends StatelessWidget {
  const _ProfilePageLogoutButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.red,
          fixedSize: Size(context.general.mediaSize.width, 40),
        ),
        onPressed: () {
          context
            ..read<ProfilePageBloc>().add(UserLogoutEvent())
            ..read<LoginBloc>().add(LogoutEvent());
        },
        child: Text(LocaleKeys.mainText_logout.tr()),
      ),
    );
  }
}
