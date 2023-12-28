interface class IBaseHeaderModel {
  Map<String, List<dynamic>>? headers;
  String? getCookie({Map<String, List<dynamic>>? headers}) {
    if (headers == null) return null;
    final cookie = headers['set-cookie']?.first as String?;
    if (cookie == null) return null;
    final cookieSplit = cookie.split(';');
    final cookieString = cookieSplit[0].split('=');
    return cookieString[1];
  }
}
