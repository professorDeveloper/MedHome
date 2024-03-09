import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medhome/core/models/request/auth/send_sms_code_request.dart';
import 'package:medhome/core/models/response/auth/send_sms_code_response.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/di/get_it.dart';
import '../../utils/response.dart';
import 'forget_verfy_event.dart';
import 'forget_verfy_state.dart';

class ForgetVerfyBloc extends Bloc<ForgetInitEvent, ForgetVerfyState> {
  final AuthApiImpl authApi=serviceLocator<AuthApiImpl>();
  ForgetVerfyBloc() : super(ForgetVerfyInitial()) {
    on<ForgetVerfyEvent>((event, emit) async{
      emit(ForgetVerfyLoading());
      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.sendSmsCodeForForgetPassword(sendSmsCodeRequest: SendSmsCodeRequest(phone: event.phone));

        if(response is Success){
          var data = response.data  as SendSmsCodeResponse;
          emit(ForgetVerfySuccessState(sendSmsCodeResponse:data ));

        }
        else if( response is Error) {
          emit(ForgetFailure(error: response.errorMessage));
        }

      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(ForgetFailure(error: error.toString()));
      }
    });
  }
}
