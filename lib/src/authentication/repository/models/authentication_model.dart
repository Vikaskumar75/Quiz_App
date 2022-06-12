part of '../authentication_repo.dart';

AuthenticationModel authenticationModelFromJson(String str) =>
    AuthenticationModel.fromJson(json.decode(str));

class AuthenticationModel {
  AuthenticationModel({
    required this.status,
    required this.data,
  });

  String status;
  User data;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        status: json['status'],
        data: User.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data.toJson(),
    };
  }
}

class User {
  User({
    required this.token,
    required this.email,
    required this.name,
    required this.id,
    this.avatar,
  });

  String name;
  String email;
  String id;
  String? avatar;
  String token;

  factory User.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userMap = json['user'];
    return User(
      name: userMap['name'],
      email: userMap['email'],
      id: userMap['_id'],
      avatar: userMap['avatar'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': <String, dynamic>{
        'name': name,
        'email': email,
        '_id': id,
        'avatar': avatar,
      },
      'token': token,
    };
  }
}
