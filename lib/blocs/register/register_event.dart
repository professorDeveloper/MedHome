part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String fullName;
  final String gender;
  final String phone;
  final String password;
  final String password2;

  RegisterButtonPressed(
      {required this.fullName,
      required this.gender,
      required this.phone,
      required this.password,
      required this.password2});
}
