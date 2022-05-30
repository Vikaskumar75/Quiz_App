part of 'authentication_repo.dart';

class AuthenticationModel {
  String name;
  String email;
  String password;
  String? avatar;
  String manufacture;
  String deviceName;
  String androidVersion;

  AuthenticationModel({
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
    required this.manufacture,
    required this.deviceName,
    required this.androidVersion,
  });

  AuthenticationModel copyWith({
    String? name,
    String? email,
    String? password,
    String? avatar,
    String? manufacture,
    String? deviceName,
    String? androidVersion,
  }) {
    return AuthenticationModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      manufacture: manufacture ?? this.manufacture,
      deviceName: deviceName ?? this.deviceName,
      androidVersion: androidVersion ?? this.androidVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
      'manufacture': manufacture,
      'deviceName': deviceName,
      'androidVersion': androidVersion,
    };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      manufacture: map['manufacture'] as String,
      deviceName: map['deviceName'] as String,
      androidVersion: map['androidVersion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationModel.fromJson(String source) =>
      AuthenticationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthenticationModel(name: $name, email: $email, password: $password, avatar: $avatar, manufacture: $manufacture, deviceName: $deviceName, androidVersion: $androidVersion)';
  }
}
