import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

enum HttpTypes { post, get, delete, put }

enum HttpPaths { login, signup, refresh, user }

enum PatchProductEnums { name, price }

enum RegisterErrors {
  emailAlreadyExists('Email is already in use'),
  phoneAlreadyExists('Phone is already in use'),
  shopNameAlreadyExists('Shopname already exists'),
  passwordNotMatch('Password not match'),
  unknownError('Unknown error');

  const RegisterErrors(this.error);
  final String? error;
}

enum LoginErrors {
  userNotFound('User not found'),
  wrongPassword('Wrong password'),
  unknownError('Unknown error');

  const LoginErrors(this.error);
  final String? error;
}

enum NetworkStatus {
  emailAlreadyExists(LocaleKeys.errors_emailAlreadyExists),
  phoneAlreadyExists(LocaleKeys.errors_phoneAlreadyExists),
  shopNameAlreadyExists(LocaleKeys.errors_shopNameAlreadyExists),
  passwordNotMatch(LocaleKeys.errors_passwordDontMatch),
  unknownError(LocaleKeys.errors_unknowError),
  userNotFound(LocaleKeys.errors_userNotFound),
  wrongPassword(LocaleKeys.errors_wrongPassword),
  ;

  const NetworkStatus(this.message);
  final String? message;
}
