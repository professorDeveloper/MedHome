import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medhome/core/models/request/auth/send_sms_code_request.dart';
import 'package:medhome/core/models/response/auth/send_sms_code_response.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/di/get_it.dart';
import '../../utils/response.dart';

part 'send_sms_code_event.dart';
part 'send_sms_code_state.dart';

class SendSmsCodeBloc extends Bloc<SendSmsCodeEvent, SendSmsCodeState> {
  final AuthApiImpl authApi=serviceLocator<AuthApiImpl>();

  SendSmsCodeBloc() : super(SendSmsCodeInitial()) {
    on<SendSmsCodeButtonPressed>((event, emit) async {
      emit(SendSmsCodeLoading());

      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.sendSmsCodeForRegister(sendSmsCodeRequest: SendSmsCodeRequest(phone: event.phone));

        if(response is Success){
          var data = response.data  as SendSmsCodeResponse;
          emit(SendSmsCodeSuccess( response: data ));

        }
        else if( response is Error) {
          emit(SendSmsCodeFailure(error: response.errorMessage.toString()));
        }

      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(SendSmsCodeFailure(error: error.toString()));
      }
    });

  }
}
