import 'package:json_annotation/json_annotation.dart';

part 'send_sms_code_response.g.dart';

@JsonSerializable()
class SendSmsCodeResponse {
  final String? detail;

  const SendSmsCodeResponse({
    this.detail,
  });
  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      SendSmsCodeResponse(
        detail: json['detail']  ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'detail': detail,
  };

}
