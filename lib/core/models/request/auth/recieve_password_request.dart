import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RecievePasswordRequest {
  final String? password;
  final String? password2;
  final String? phone;

  const RecievePasswordRequest({
    this.password,
    this.password2,
    this.phone,
  });

  factory RecievePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$RecievePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RecievePasswordRequestToJson(this);
}

RecievePasswordRequest _$RecievePasswordRequestFromJson(
    Map<String, dynamic> json) =>
    RecievePasswordRequest(
      password: json['password'] as String?,
      password2: json['password2'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$RecievePasswordRequestToJson(
    RecievePasswordRequest instance) =>
    <String, dynamic>{
      'password': instance.password,
      'password2': instance.password2,
      'phone': instance.phone,
    };
