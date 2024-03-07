import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponse {
  final String refresh;
  final String access;

  const LoginResponse({
    required this.refresh,
     required this.access,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(
        refresh: json['refresh']  ?? "",
          access: json['access']  ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'refresh': refresh,
    'access': access,
  };
}
