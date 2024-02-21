import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  DeviceInfoService._();
  static final DeviceInfoService _instance = DeviceInfoService._();
  factory DeviceInfoService() => _instance;
  static DeviceInfoService get getInstacne => _instance;

  Future<void> initialize() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
      final AndroidBuildVersion version = deviceInfo.version;
      _osVersion = version.baseOS ?? version.release;
      _deviceName = deviceInfo.device;
      _manufacturer = deviceInfo.manufacturer;
    } else if (Platform.isIOS) {
      final IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
      _osVersion = deviceInfo.systemVersion;
      _deviceName = deviceInfo.name;
      _manufacturer = 'Apple';
    } else {
      final WebBrowserInfo deviceInfo = await deviceInfoPlugin.webBrowserInfo;
      _osVersion = deviceInfo.appVersion ?? 'Unknown';
      _deviceName = deviceInfo.platform ?? 'Unknown';
      _manufacturer = deviceInfo.browserName.name;
    }
  }

  late String _deviceName;
  String get deviceName => _deviceName;

  late String _manufacturer;
  String get manufacturer => _manufacturer;

  late String _osVersion;
  String get osVerison => _osVersion;
}
