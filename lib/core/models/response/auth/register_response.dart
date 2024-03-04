import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  final User? user;

  const RegisterResponse({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? gender;
  final String? phone;

  const User({
    this.fullName,
    this.gender,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    accessToken: json['access_token'] as String?,
    refreshToken: json['refresh_token'] as String?,
    tokenType: json['token_type'] as String?,
    user: json['user'] != null ? User.fromJson(json['user']) : null,
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
      'user': instance.user?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    fullName: json['full_name'] as String?,
    gender: json['gender'] as String?,
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'full_name': instance.fullName,
  'gender': instance.gender,
  'phone': instance.phone,
};
