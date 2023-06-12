import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_profile_bloc.dart';

import '../../../../core/init/translation/locale_keys.g.dart';
import '../../../models/user_model/user.dart';

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state.user != null) {
          User? user = state.user;
          return ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              UserProfileCardName(name: user?.name),
              UserProfileCardEmail(
                email: user?.email,
              ),
              UserProfileCardPhone(
                phone: user?.phone,
              ),
              UserProfileCardShopName(
                shopName: user?.shopName,
              ),
              UserProfileCardExpirationDate(
                dateTime: DateTime.tryParse(user?.updatedAt ?? ""),
              ),
            ],
          );
        } else if (state.user == null) {
          return Center(
            child: Text(LocaleKeys.errors_failedLoadData.tr()),
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

class UserProfileCardExpirationDate extends StatelessWidget {
  const UserProfileCardExpirationDate({super.key, this.dateTime});
  final DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_expirationDate.tr()),
      subtitle:
          Text(DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now())),
    );
  }
}

class UserProfileCardShopName extends StatelessWidget {
  const UserProfileCardShopName({super.key, this.shopName});
  final String? shopName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(LocaleKeys.profile_shopName.tr()),
      subtitle: Text(shopName ?? ""),
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
      subtitle: Text(phone ?? ""),
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
      subtitle: Text(email ?? ""),
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
      subtitle: Text(name ?? ""),
    );
  }
}
