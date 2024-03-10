part of 'recieve_password_bloc.dart';

@immutable
abstract class RecievePasswordState {}

class RecievePasswordInitial extends RecievePasswordState {}
class RecievePasswordLoading extends RecievePasswordState {}
class RecievePasswordSuccess extends RecievePasswordState {
  final SendSmsCodeResponse sendSmsCodeResponse;

  RecievePasswordSuccess({required this.sendSmsCodeResponse});

}
class RecievePasswordFailure extends RecievePasswordState {

  final String error;

  RecievePasswordFailure({required this.error});
}
