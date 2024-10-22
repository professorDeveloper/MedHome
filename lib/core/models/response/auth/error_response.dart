import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class ErrorResponse {
  final String? detail;
  final List<String>? phone;
  const ErrorResponse({
    this.detail, this.phone});
  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      ErrorResponse(
        detail: json['detail']  ?? json['phone'][0] ?? "",
        phone:  json['phone']
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'detail': detail,
    'phone':phone
  };

}
