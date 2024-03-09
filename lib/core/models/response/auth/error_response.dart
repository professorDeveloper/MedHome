import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class ErrorResponse {
  final String? detail;

  const ErrorResponse({
    this.detail,
  });
  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      ErrorResponse(
        detail: json['detail']  ?? json['phone'][0] ?? "",
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'detail': detail,
  };

}
