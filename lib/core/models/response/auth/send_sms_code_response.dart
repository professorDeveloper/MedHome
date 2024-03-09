import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class SendSmsCodeResponse {
  final String detail;

  const SendSmsCodeResponse({
   required this.detail,
  });
  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      SendSmsCodeResponse(
        detail: json['detail']  ?? json['phone'][0] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'detail': detail,
  };

}
