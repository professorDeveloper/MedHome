import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginRequest {
  final String? phone;
  final String? password;

  const LoginRequest({
    this.phone,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest(
    phone: json['phone'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic>  _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      "phone": instance.phone,
      "password": instance.password,
    };
