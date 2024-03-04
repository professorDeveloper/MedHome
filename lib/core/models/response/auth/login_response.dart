import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  final String? refresh;
  final String? access;

  const LoginResponse({
    this.refresh,
    this.access,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
        refresh: json['refresh'] as String?,
        access: json['access'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'refresh': refresh,
    'access': access,
  };
}
