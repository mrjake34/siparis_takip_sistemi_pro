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

enum NetworkStatus {
  registerSuccess(LocaleKeys.apiMessage_registerSuccess),
  creatdSuccess(LocaleKeys.apiMessage_createdSuccess),
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
  unknownError(LocaleKeys.apiMessage_unknowError);

  const NetworkStatus(this.message);
  final String? message;

  static NetworkStatus getStatus(String value) => switch (value) {
        'Register process completed successfully' =>
          NetworkStatus.registerSuccess,
        'Create process completed successfully' => NetworkStatus.creatdSuccess,
        'Update process completed successfully' => NetworkStatus.updateSuccess,
        'Delete process completed successfully' => NetworkStatus.deleteSuccess,
        'Detail process completed successfully' => NetworkStatus.detailsSuccess,
        'Login process completed successfully' => NetworkStatus.loginSuccess,
        'Item listed successfuly' => NetworkStatus.listSuccess,
        'Register process completed with an error' =>
          NetworkStatus.registerFailed,
        'Create process completed with an error' => NetworkStatus.createFailed,
        'Update process completed with an error' => NetworkStatus.updateFailed,
        'Delete process completed with an error' => NetworkStatus.deleteFailed,
        'Detail process completed with an error' => NetworkStatus.detailsFailed,
        'Login process completed with an error' => NetworkStatus.loginFailed,
        'Inputs must be filled' => NetworkStatus.inputsNotFilled,
        'Inputs must be filled or check input types' =>
          NetworkStatus.inputsNotFilledOrTypesWrong,
        'User not found' => NetworkStatus.userNotFound,
        'Wrong UserId' => NetworkStatus.userIdFailed,
        'Courier not found' => NetworkStatus.courierNotFound,
        'Email is already in use' => NetworkStatus.emailFailed,
        'ShopName is already in use' => NetworkStatus.shopNameFailed,
        'Phone is already in use' => NetworkStatus.phoneFailed,
        'Product name already in use' => NetworkStatus.productNameFailed,
        'Product not found' => NetworkStatus.productNotFound,
        'Order not found' => NetworkStatus.orderNotFound,
        'Customer not found' => NetworkStatus.customerNotFound,
        'Phone or Email is already in use' => NetworkStatus.phoneOrEmailFailed,
        'Unauthorized' => NetworkStatus.unauthorized,
        'Unknown error' => NetworkStatus.unknownError,
        _ => NetworkStatus.unknownError,
      };
}
