abstract class IBaseHeaderModel {
  Map<String, List<dynamic>>? headers;
  String? getCookie({Map<String, List<dynamic>>? headers});
}
