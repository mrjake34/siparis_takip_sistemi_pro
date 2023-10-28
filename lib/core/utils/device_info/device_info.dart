import 'package:device_info_plus/device_info_plus.dart';

final class DeviceInfo {
  DeviceInfo._();

  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static AndroidDeviceInfo? androidInfo;
  static IosDeviceInfo? iosInfo;
  static WindowsDeviceInfo? windowsInfo;
  static MacOsDeviceInfo? macOsInfo;
  static LinuxDeviceInfo? linuxInfo;
  static WebBrowserInfo? webBrowserInfo;

  static DeviceType getDeviceType() {
    if (deviceInfo is AndroidDeviceInfo) {
      return DeviceType.android;
    } else if (deviceInfo is IosDeviceInfo) {
      return DeviceType.ios;
    } else if (deviceInfo is WindowsDeviceInfo) {
      return DeviceType.windows;
    } else if (deviceInfo is MacOsDeviceInfo) {
      return DeviceType.macOs;
    } else if (deviceInfo is LinuxDeviceInfo) {
      return DeviceType.linux;
    } else if (deviceInfo is WebBrowserInfo) {
      return DeviceType.web;
    } else {
      return DeviceType.android;
    }
  }

  static Future<void> getDeviceInfo() async {
    if (deviceInfo is AndroidDeviceInfo) {
      androidInfo = await deviceInfo.androidInfo;
    } else if (deviceInfo is IosDeviceInfo) {
      iosInfo = await deviceInfo.iosInfo;
    } else if (deviceInfo is WindowsDeviceInfo) {
      windowsInfo = await deviceInfo.windowsInfo;
    } else if (deviceInfo is MacOsDeviceInfo) {
      macOsInfo = await deviceInfo.macOsInfo;
    } else if (deviceInfo is LinuxDeviceInfo) {
      linuxInfo = await deviceInfo.linuxInfo;
    } else if (deviceInfo is WebBrowserInfo) {
      webBrowserInfo = await deviceInfo.webBrowserInfo;
    }
  }
}

enum DeviceType {
  android,
  ios,
  windows,
  macOs,
  linux,
  web,
}
