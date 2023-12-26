import 'package:intl/intl.dart' show DateFormat;

final class AppStrings {
  AppStrings._();

  static const String inLineOrderString = 'waiting';
  static const String inProcessOrderString = 'inProcess';
  static const String onTheWayOrderString = 'inDistribution';
  static const String isCompleteOrderString = 'completed';

  static String dateTimeNow =
      DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());

  static const String appName = 'Sipariş Takip Sistemi Pro';
  static const String appVersion = 'v1.0.0';

  static const String mainLogoPath = 'assets/images/main-logo.png';
}
