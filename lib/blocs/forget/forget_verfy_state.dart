


import 'package:flutter/cupertino.dart';

import '../../core/models/response/auth/send_sms_code_response.dart';

@immutable
abstract class ForgetVerfyState {}

class ForgetVerfyInitial extends ForgetVerfyState {}
class ForgetVerfyLoading extends ForgetVerfyState {}
class ForgetVerfySuccessState extends ForgetVerfyState {
   final SendSmsCodeResponse sendSmsCodeResponse;

   ForgetVerfySuccessState({required this.sendSmsCodeResponse});
}
class ForgetFailure extends ForgetVerfyState {
   final String error;

   ForgetFailure({required this.error});
}
