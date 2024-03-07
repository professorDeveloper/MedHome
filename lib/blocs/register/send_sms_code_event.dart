part of 'send_sms_code_bloc.dart';

@immutable
abstract class SendSmsCodeEvent {

}
class SendSmsCodeButtonPressed extends SendSmsCodeEvent {
  final String phone;

  SendSmsCodeButtonPressed({required this.phone});
}
