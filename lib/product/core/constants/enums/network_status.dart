import 'package:siparis_takip_sistemi_pro/product/core/base/mixin/status_mixin.dart';
import 'package:siparis_takip_sistemi_pro/product/utils/translations/locale_keys.g.dart';

enum HttpTypes { post, get, delete, put }

enum HttpPaths { login, signup, refresh, user }

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

enum NetworkStatus with StatusMixin {
  success(LocaleKeys.apiMessage_success),
  registerSuccess(LocaleKeys.apiMessage_registerSuccess),
  createdSuccess(LocaleKeys.apiMessage_createdSuccess),
  updateSuccess(LocaleKeys.apiMessage_updateSuccess),
  deleteSuccess(LocaleKeys.apiMessage_deleteSuccess),
  detailsSuccess(LocaleKeys.apiMessage_detailsSuccess),
  loginSuccess(LocaleKeys.apiMessage_loginSuccess),
  listSuccess(LocaleKeys.apiMessage_listSuccess),
  registerFailed(LocaleKeys.apiMessage_registerFailed),
  createFailed(LocaleKeys.apiMessage_createFailed),
  updateFailed(LocaleKeys.apiMessage_updateFailed),
  deleteFailed(LocaleKeys.apiMessage_deleteFailed),
  detailsFailed(LocaleKeys.apiMessage_detailsFailed),
  loginFailed(LocaleKeys.apiMessage_loginFailed),
  inputsNotFilled(LocaleKeys.apiMessage_inputsNotFilled),
  inputsNotFilledOrTypesWrong(
    LocaleKeys.apiMessage_inputsNotFilledOrTypesWrong,
  ),
  userNotFound(LocaleKeys.apiMessage_userNotFound),
  userIdFailed(LocaleKeys.apiMessage_userIdFailed),
  courierNotFound(LocaleKeys.apiMessage_courierNotFound),
  emailFailed(LocaleKeys.apiMessage_emailFailed),
  shopNameFailed(LocaleKeys.apiMessage_shopNameFailed),
  phoneFailed(LocaleKeys.apiMessage_phoneFailed),
  productNameFailed(LocaleKeys.apiMessage_productNameFailed),
  productNotFound(LocaleKeys.apiMessage_productNotFound),
  orderNotFound(LocaleKeys.apiMessage_orderNotFound),
  customerNotFound(LocaleKeys.apiMessage_customerNotFound),
  phoneOrEmailFailed(LocaleKeys.apiMessage_phoneOrEmailFailed),
  unauthorized(LocaleKeys.apiMessage_unauthorized),
  unknownError(LocaleKeys.apiMessage_unknowError),
  failedLoadData(LocaleKeys.errors_failedLoadData);

  const NetworkStatus(this.message);
  final String? message;
}
