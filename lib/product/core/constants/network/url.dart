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
  @Deprecated('Use path')
  final String loginUserUrl = 'https://api.efes.tech/login';
  @Deprecated('Use path')
  final String refreshTokenUrl = 'https://api.efes.tech/refresh/';
  @Deprecated('Use path')
  final String sendUserUrl = 'https://api.efes.tech/signup';
  @Deprecated('Use path')
  final String getUserUrl = 'https://api.efes.tech/user/';
  @Deprecated('Use path')
  final String postOrderUrl = 'https://api.efes.tech/orders';
  @Deprecated('Use path')
  final String getOrderUrl = 'https://api.efes.tech/orders/';
  @Deprecated('Use path')
  final String getCouriersUrl = 'https://api.efes.tech/couriers';
  @Deprecated('Use path')
  final String courierLoginUrl = 'https://api.efes.tech/couriers/login';
  @Deprecated('Use path')
  final String deleteCourierUrl = 'https://api.efes.tech/couriers/';
  @Deprecated('Use path')
  final String getCustomerUrl = 'https://api.efes.tech/customers';
  @Deprecated('Use path')
  final String deleteCustomerUrl = 'https://api.efes.tech/customers/';
  @Deprecated('Use path')
  final String productUrl = 'https://api.efes.tech/products';
  @Deprecated('Use path')
  final String productUrlWithSlash = 'https://api.efes.tech/products/';

  /// Url Paths
  static String get baseUrlGet => 'https://api.efes.tech';
  static String get loginPath => '/login';
  static String get signupPath => '/signup';
  static String get refreshPath => '/refresh/';
  static String get userPath => '/user/';
  static String get orderPath => '/orders';
  static String get courierPath => '/couriers';
  static String get customerPath => '/customers';
  static String get productPath => '/products';
}
