import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class ProfileResponse {
  final int id;
  final String phone;
  final String fullName;
  final String email;
  final String jshshr;
  final String age;
  final String gender;
  final String dateJoined;
  @JsonKey(name: 'last_login')
  final String lastLogin;

  const ProfileResponse({
    required this.id,
    required   this.phone,
    required this.fullName,
    required this.email,
    required this.jshshr,
    required  this.age,
    required  this.gender,
    required  this.dateJoined,
    required  this.lastLogin,
  });
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
        id: json['id']  ?? 0,
        phone: json['phone']  ?? "",
        fullName: json['fullName']  ?? "",
        email: json['email']  ?? "",
        jshshr: json['jshshr']  ?? "",
        gender: json['gender']  ?? "",
        dateJoined: json['dateJoined']  ?? "",
        lastLogin: json['lastLogin']  ?? "",
        age: json['age']  ?? "",
      );


}
