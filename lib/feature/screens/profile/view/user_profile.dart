import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siparis_takip_sistemi_pro/product/core/base/view/base_scaffold.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/view/user_details_widget.dart';

import '../../../../product/core/constants/main_functions.dart';
import '../../../../product/core/constants/colors/colors.dart';
import '../../../../product/core/constants/enums/enums.dart';
import '../../../../product/core/constants/size/sizes.dart';
import '../../../../product/utils/translations/locale_keys.g.dart';
import '../../../../product/providers/main_providers.dart';
import '../bloc/user_profile_bloc.dart';
import 'choose_theme_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    context.read<UserProfileBloc>().add(const FetchUserDetailsEvent());
    final pageSize = MediaQuery.of(context).size;
    return PageBuilder(pageSize: pageSize);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    required this.pageSize,
    super.key,
  });

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(pagePadding),
              child: Column(
                children: [
                  const UserDetailWidget(),
                  const ChooseThemeWidget(),
                  const ChangeLanguageField(),
                  const ChangeCurrencySymbolField(),
                  ProfilePageLogoutButton(pageSize: pageSize),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
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
    return BlocBuilder<UserProfileBloc, UserProfileState>(
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

class ChangeLanguageField extends StatelessWidget {
  const ChangeLanguageField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(Icons.keyboard_double_arrow_down),
      title: Text(LocaleKeys.profile_changeLanguage.tr()),
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.setLocale(const Locale('en', 'US'));
              },
              child: Text(LocaleKeys.mainText_english.tr()),
            ),
            TextButton(
              onPressed: () {
                context.setLocale(const Locale('tr', 'TR'));
              },
              child: Text(LocaleKeys.mainText_turkish.tr()),
            ),
          ],
        ),
      ],
    );
  }
}

class ChangeCurrencySymbolField extends StatelessWidget {
  const ChangeCurrencySymbolField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: const Icon(Icons.keyboard_double_arrow_down),
      title: Text(LocaleKeys.mainText_changeCurrencySymbol.tr()),
      children: [
        Wrap(
          children: [
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = '₺';
              },
              icon: const Icon(FontAwesomeIcons.turkishLiraSign),
            ),
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = '€';
              },
              icon: const Icon(FontAwesomeIcons.euroSign),
            ),
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = r'$';
              },
              icon: const Icon(FontAwesomeIcons.dollarSign),
            ),
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = '£';
              },
              icon: const Icon(FontAwesomeIcons.sterlingSign),
            ),
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = '₽';
              },
              icon: const Icon(FontAwesomeIcons.rubleSign),
            ),
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = '₼';
              },
              icon: const Icon(FontAwesomeIcons.manatSign),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfilePageLogoutButton extends StatelessWidget {
  const ProfilePageLogoutButton({
    required this.pageSize,
    super.key,
  });

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: Colors.red,
            fixedSize: Size(pageSize.width, 40)),
        onPressed: () {
          MainFunctions.logOutDialog(context: context);
        },
        child: Text(LocaleKeys.mainText_logout.tr()),
      ),
    );
  }
}
