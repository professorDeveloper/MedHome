import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VerifyRequest {
  final String? phone;
  final int? code;

  const VerifyRequest({
    this.phone,
    this.code,
  });

  factory VerifyRequest.fromJson(Map<String, int?> json) =>
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
      "phone": instance.phone as String,
      "code": instance.code as int,
    };
