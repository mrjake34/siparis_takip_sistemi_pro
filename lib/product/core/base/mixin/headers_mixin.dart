mixin HeadersMixin {
  String? getCookie(Map<String, List<String>>? map, {CookieTypes? type}) {
    if (type == CookieTypes.setCookie) {
      return _getSetCookie(map);
    } else if (type == CookieTypes.authenticationToken) {
      return _getAuthenticationToken(map);
    }
    return null;
  }

  static String? _getAuthenticationToken(Map<String, List<String>>? map) {
    if (map == null) return null;
    final cookie = map['authentication']?.first;
    if (cookie == null) return null;
    final cookieSplit = cookie.split(';');
    final cookieString = cookieSplit[0].split('=');
    return cookieString[1];
  }

  static String? _getSetCookie(Map<String, List<String>>? map) {
    if (map == null) return null;
    final cookie = map['set-cookie']?.first;
    if (cookie == null) return null;
    final cookieSplit = cookie.split(';');
    final cookieString = cookieSplit[0].split('=');
    return cookieString[1];
  }
}

enum CookieTypes { setCookie, authenticationToken }
