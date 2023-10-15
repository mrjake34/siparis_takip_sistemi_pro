// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

final class CustomCookieManager {
  CustomCookieManager._();

  static void setCookie(String key, String value, int days) {
    final expiration = DateTime.now().add(Duration(days: days));
    final cookie = '$key=$value;expires=${expiration.toUtc()}';
    document.cookie = cookie;
  }

  static String getCookie(String key) {
    final cookies = document.cookie;
    final list = cookies?.split(';');
    if (list != null) {
      for (final item in list) {
        final keyValue = item.split('=');
        if (keyValue[0].trim() == key) {
          return keyValue[1];
        }
      }
    }
    return '';
  }
}
