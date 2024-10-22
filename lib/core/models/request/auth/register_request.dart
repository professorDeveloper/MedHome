import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? gender;
  final String? phone;
  final String? password;
  final String? password2;

  const   RegisterRequest({
    this.fullName,
    this.gender,
    this.phone,
    this.password,
    this.password2,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return RegisterRequest(
    fullName: json['full_name'] as String?,
    gender: json['gender'] as String?,
    phone: json['phone'] as String?,
    password: json['password'] as String?,
    password2: json['password2'] as String?,
  );
}

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'gender': instance.gender,
      'phone': instance.phone,
      'password': instance.password,
      'password2': instance.password2,
    };
