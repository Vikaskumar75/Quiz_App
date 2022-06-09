part of 'authentication_repo.dart';

OtpModel otpFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    required this.status,
    required this.data,
  });

  String status;
  Data data;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json['status'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'data': data.toJson(),
      };
}

class Data {
  Data({
    required this.otp,
  });

  int otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: json['otp'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'otp': otp,
      };
}
