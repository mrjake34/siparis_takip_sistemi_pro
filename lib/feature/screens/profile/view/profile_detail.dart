import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siparis_takip_sistemi_pro/feature/screens/profile/model/user.dart';

import '../../../../product/utils/translations/locale_keys.g.dart';
import '../bloc/user_profile_bloc.dart';

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state.user == null) return const _FailedLoadData();
        if (state.user != null) return _PageFields(user: state.user);
        return const Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}

class _FailedLoadData extends StatelessWidget {
  const _FailedLoadData();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.errors_failedLoadData.tr()));
  }
}

class _PageFields extends StatelessWidget {
  const _PageFields({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _UserProfileCardName(name: user.name),
        _UserProfileCardEmail(
          email: user.email,
        ),
        _UserProfileCardPhone(
          phone: user.phone,
        ),
        _UserProfileCardShopName(
          shopName: user.shopName,
        ),
        _UserProfileCardExpirationDate(
          dateTime: user.updatedAt ?? DateTime.now(),
        ),
      ],
    );
  }
}

final class _UserProfileCardExpirationDate extends StatelessWidget {
  const _UserProfileCardExpirationDate({
    required this.dateTime,
  });
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_expirationDate.tr()),
      subtitle: Text(DateFormat('dd/MM/yyyy').format(dateTime)),
    );
  }
}

final class _UserProfileCardShopName extends StatelessWidget {
  const _UserProfileCardShopName({this.shopName});
  final String? shopName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_shopName.tr()),
      subtitle: Text(shopName ?? ''),
    );
  }
}

class UserProfileCardPhone extends StatelessWidget {
  const UserProfileCardPhone({super.key, this.phone});
  final String? phone;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_phoneNumber.tr()),
      subtitle: Text(phone ?? ''),
    );
  }
}

class UserProfileCardEmail extends StatelessWidget {
  const UserProfileCardEmail({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_emailAddress.tr()),
      subtitle: Text(email ?? ''),
    );
  }
}

class UserProfileCardName extends StatelessWidget {
  const UserProfileCardName({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_fullName.tr()),
      subtitle: Text(name ?? ''),
    );
  }
}
