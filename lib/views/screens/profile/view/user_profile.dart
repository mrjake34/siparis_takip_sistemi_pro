import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:siparis_takip_sistemi_pro/core/constants/size/sizes.dart';

import '../../../../components/main-functions.dart';
import '../../../../core/constants/colors/colors.dart';
import '../../../../core/constants/enums/enums.dart';
import '../../../../core/init/translation/locale_keys.g.dart';
import '../../../../providers/main_providers.dart';
import '../bloc/user_profile_bloc.dart';
import 'user_details_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    context.read<UserProfileBloc>().add(const FetchUserDetailsEvent());
    Size pageSize = MediaQuery.of(context).size;
    return PageBuilder(pageSize: pageSize);
  }
}

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    super.key,
    required this.pageSize,
  });

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.profile_profileTitle.tr(),
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          const LinearField(),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(pagePadding),
              child: Column(
                children: [
                  const UserDetailWidget(),
                  //const ChooseThemeWidget(),
                  const ChangeLanguageField(),
                  const ChangeCurrencySymbolField(),
                  ProfilePageLogoutButton(pageSize: pageSize),
                  const SizedBox(
                    height: 30,
                  )
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
      title: Text(LocaleKeys.profile_changeLanguage.tr()),
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  context.setLocale(const Locale('en', 'US'));
                },
                child: Text(LocaleKeys.mainText_english.tr())),
            TextButton(
                onPressed: () {
                  context.setLocale(const Locale('tr', 'TR'));
                },
                child: Text(LocaleKeys.mainText_turkish.tr())),
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
      title: Text(LocaleKeys.mainText_changeCurrencySymbol.tr()),
      children: [
        Wrap(
          children: [
            IconButton(
              onPressed: () {
                context.read<ChangeCurrencyPriceSymbol>().changeSymbol = "₺";
              },
              icon: const Icon(FontAwesomeIcons.turkishLiraSign),
            ),
            IconButton(
                onPressed: () {
                  context.read<ChangeCurrencyPriceSymbol>().changeSymbol = "€";
                },
                icon: const Icon(FontAwesomeIcons.euroSign)),
            IconButton(
                onPressed: () {
                  context.read<ChangeCurrencyPriceSymbol>().changeSymbol = "\$";
                },
                icon: const Icon(FontAwesomeIcons.dollarSign)),
            IconButton(
                onPressed: () {
                  context.read<ChangeCurrencyPriceSymbol>().changeSymbol = "£";
                },
                icon: const Icon(FontAwesomeIcons.sterlingSign)),
            IconButton(
                onPressed: () {
                  context.read<ChangeCurrencyPriceSymbol>().changeSymbol = "₽";
                },
                icon: const Icon(FontAwesomeIcons.rubleSign)),
            IconButton(
                onPressed: () {
                  context.read<ChangeCurrencyPriceSymbol>().changeSymbol = "₼";
                },
                icon: const Icon(FontAwesomeIcons.manatSign)),
          ],
        ),
      ],
    );
  }
}

class ProfilePageLogoutButton extends StatelessWidget {
  const ProfilePageLogoutButton({
    super.key,
    required this.pageSize,
  });

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 5.0,
              backgroundColor: Colors.red,
              fixedSize: Size(pageSize.width, 40.0)),
          onPressed: () {
            MainFunctions.instance.logOutDialog(context);
          },
          child: Text(LocaleKeys.mainText_logout.tr())),
    );
  }
}
