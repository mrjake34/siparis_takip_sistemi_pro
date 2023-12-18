mixin class AppNetwork {
  AppNetwork._init();
  static final AppNetwork _instance = AppNetwork._init();
  static AppNetwork get instance => _instance;

  final String translationPath = 'assets/translations';

  //Links
  Uri membershipAgreementLink = Uri.parse(
    'https://docs.google.com/document/d/1GbY7iw8yARRuZWVmnEo7nzTI96z_4eH6G5VkUWDaI34',
  );
  final String baseUrl = 'https://api.efes.tech';
  final login = '/login';
  final signup = '/signup';
  final String loginUserUrl = 'https://api.efes.tech/login';
  final String refreshTokenUrl = 'https://api.efes.tech/refresh/';
  final String sendUserUrl = 'https://api.efes.tech/signup';
  final String getUserUrl = 'https://api.efes.tech/user/';
  final String postOrderUrl = 'https://api.efes.tech/orders';
  final String getOrderUrl = 'https://api.efes.tech/orders/';
  final String getCouriersUrl = 'https://api.efes.tech/couriers';
  final String courierLoginUrl = 'https://api.efes.tech/couriers/login';
  final String deleteCourierUrl = 'https://api.efes.tech/couriers/';
  final String getCustomerUrl = 'https://api.efes.tech/customers';
  final String deleteCustomerUrl = 'https://api.efes.tech/customers/';
  final String productUrl = 'https://api.efes.tech/products';
  final String productUrlWithSlash = 'https://api.efes.tech/products/';
}
