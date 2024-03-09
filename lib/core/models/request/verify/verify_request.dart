import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VerifyRequest {

  final String? phone;
  final int? code;

  const VerifyRequest({
    this.phone,
    this.code,
  });

  factory VerifyRequest.fromJson(Map<String, dynamic?> json) =>
      _$VerifyRequestFromJson(json);

  Map<String?, dynamic> toJson() => _$VerifyRequestToJson(this);
}

VerifyRequest _$VerifyRequestFromJson(Map<String?, dynamic?> json) {
  return VerifyRequest(
    phone: json['phone'] as String?,
    code: json['code'] as int?,
  );
}

Map<String?, dynamic> _$VerifyRequestToJson(VerifyRequest instance) =>
    <String?, dynamic>{
      "phone": instance.phone,
      "code": int.parse(instance.code.toString()),
    };
