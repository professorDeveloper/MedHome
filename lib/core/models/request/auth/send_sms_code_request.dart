import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class SendSmsCodeRequest {
  final String? phone;

  const SendSmsCodeRequest({
    this.phone,
  });

  factory SendSmsCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeRequesttFromJson(json);

  Map<String, dynamic> toJson() => _$RSendSmsCodeRequestToJson(this);
}

 _$SendSmsCodeRequesttFromJson(Map<String, dynamic> json) {
  return SendSmsCodeRequest(
    phone: json['phone'] as String?,
  );
}

Map<String, dynamic> _$RSendSmsCodeRequestToJson(SendSmsCodeRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };
