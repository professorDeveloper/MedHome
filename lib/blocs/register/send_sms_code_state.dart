part of 'send_sms_code_bloc.dart';

@immutable
abstract class SendSmsCodeState {}

class SendSmsCodeInitial extends SendSmsCodeState {}
class SendSmsCodeSuccess extends SendSmsCodeState {
  final SendSmsCodeResponse response;

  SendSmsCodeSuccess({required this.response});
}
class SendSmsCodeLoading extends SendSmsCodeState{}
class SendSmsCodeFailure extends SendSmsCodeState{
  final String error;

  SendSmsCodeFailure({required this.error});

}
