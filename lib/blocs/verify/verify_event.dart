part of 'verify_bloc.dart';
@immutable
abstract class VerifyEvent {}
class VerifyButtonPressed extends VerifyEvent {
  final Int code;
  final String phone;
  VerifyButtonPressed({required this.phone,required this.code});
}