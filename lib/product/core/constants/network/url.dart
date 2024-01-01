mixin class AppNetwork {
  AppNetwork._init();

  //Links
  static String get membershipAgreementLink =>
      'https://docs.google.com/document/d/1GbY7iw8yARRuZWVmnEo7nzTI96z_4eH6G5VkUWDaI34';

  /// Url Paths
  static String get baseUrl => 'https://api.efes.tech';
  static String get loginPath => '/login';
  static String get signupPath => '/signup';
  static String get refreshPath => '/refresh/';
  static String get userPath => '/user/';
  static String get orderPath => '/orders';
  static String get courierPath => '/couriers';
  static String get customerPath => '/customers';
  static String get productPath => '/products';
}
