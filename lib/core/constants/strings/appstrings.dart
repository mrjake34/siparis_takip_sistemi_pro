class AppStrings {
  AppStrings._init();
  static final AppStrings _instance = AppStrings._init();
  static AppStrings get instance => _instance;

  final String inLineOrderString = 'waiting';
  final String inProcessOrderString = 'inProcess';
  final String onTheWayOrderString = 'inDistribution';
  final String isCompleteOrderString = 'completed';
}
