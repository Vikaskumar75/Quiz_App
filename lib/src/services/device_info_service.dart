import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  DeviceInfoService._();
  static final DeviceInfoService _instance = DeviceInfoService._();
  factory DeviceInfoService() => _instance;
  static DeviceInfoService get getInstacne => _instance;

  Future<void> initialize() async {
    final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final AndroidDeviceInfo _deviceInfo = await _deviceInfoPlugin.androidInfo;
      final AndroidBuildVersion _version = _deviceInfo.version;
      _osVersion = _version.baseOS ?? _version.release ?? 'Unknown';
      _deviceName = _deviceInfo.device ?? 'Android';
      _manufacturer = _deviceInfo.manufacturer ?? 'Unknown';
    } else if (Platform.isIOS) {
      final IosDeviceInfo _deviceInfo = await _deviceInfoPlugin.iosInfo;
      _osVersion = _deviceInfo.systemVersion ?? 'Unknown';
      _deviceName = _deviceInfo.name ?? 'Apple Device';
      _manufacturer = 'Apple';
    } else {
      final WebBrowserInfo _deviceInfo = await _deviceInfoPlugin.webBrowserInfo;
      _osVersion = _deviceInfo.appVersion ?? 'Unknown';
      _deviceName = _deviceInfo.platform ?? 'Unknown';
      _manufacturer = _deviceInfo.browserName.name;
    }
  }

  late String _deviceName;
  String get deviceName => _deviceName;

  late String _manufacturer;
  String get manufacturer => _manufacturer;

  late String _osVersion;
  String get osVerison => _osVersion;
}
