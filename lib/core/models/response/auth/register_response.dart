import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class RegisterResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final User user;

  const RegisterResponse({
    required this.accessToken,
    required   this.refreshToken,
    required this.tokenType,
    required  this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    accessToken: json['access_token'] ?? "",
    refreshToken: json['refresh_token'] ?? "",
    tokenType: json['token_type'] ?? "",
    user: json['user'] != null ? User.fromJson(jsonDecode(json['user'])) : User(fullName: '',phone: '',gender: ''),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'token_type': tokenType,
    'user': user.toJson(),
  };
}

@JsonSerializable()
class User {
  final String fullName;
  final String gender;
  final String phone;

  const User({
    required this.fullName,
    required this.gender,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json['full_name'] ?? "",
    gender: json['gender'] ?? "",
    phone: json['phone'] ?? "",
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'full_name': fullName,
    'gender': gender,
    'phone': phone,
  };
}
