import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VerifyRequest {
  final String? phone;
  final Int? code;

  const VerifyRequest({
    this.phone,
    this.code,
  });

  factory VerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

VerifyRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return VerifyRequest(
    phone: json['phone'] as String?,
    code: json['code'] as Int?,
  );
}

Map<String, dynamic> _$LoginRequestToJson(VerifyRequest instance) =>
    <String, dynamic>{
      "phone": instance.phone,
      "code": instance.code,
    };
