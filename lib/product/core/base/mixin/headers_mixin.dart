mixin HeadersMixin {
  String? getCookie(Map<String, List<String>>? map) {
    if (map == null) return null;
    final cookie = map['set-cookie']?.first;
    if (cookie == null) return null;
    final cookieSplit = cookie.split(';');
    final cookieString = cookieSplit[0].split('=');
    return cookieString[1];
  }
}
