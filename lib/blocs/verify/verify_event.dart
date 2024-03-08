part of 'verify_bloc.dart';
@immutable
abstract class VerifyEvent {}
class VerifyButtonPressed extends VerifyEvent {
  final int code;
  final String phone;
  VerifyButtonPressed({required this.code, required this.phone});
}