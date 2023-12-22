abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? object});
  Future<void> navigateToPageRemoveAll({String? path, Object? object});
  void navigateToBack();
}
