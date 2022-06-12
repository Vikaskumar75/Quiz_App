part of '../authentication_repo.dart';

class RegistrationModel {
  final String name;
  final String email;
  final String password;

  const RegistrationModel({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final DeviceInfoService _deviceInfo = DeviceInfoService.getInstacne;
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'device_name': _deviceInfo.deviceName,
      'device_manufacturer': _deviceInfo.manufacturer,
      'os_version': _deviceInfo.osVerison,
    };
  }
}
