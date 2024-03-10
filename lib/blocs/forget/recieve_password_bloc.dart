import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medhome/core/models/request/auth/recieve_password_request.dart';
import 'package:meta/meta.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/di/get_it.dart';
import '../../core/models/response/auth/send_sms_code_response.dart';
import '../../utils/response.dart';

part 'recieve_password_event.dart';
part 'recieve_password_state.dart';

class RecievePasswordBloc extends Bloc<RecievePasswordEvent, RecievePasswordState> {
  final AuthApiImpl authApi=serviceLocator<AuthApiImpl>();

  RecievePasswordBloc() : super(RecievePasswordInitial()) {
    on<RecievePasswordEvent>((event, emit)async {
      emit(RecievePasswordLoading());
      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.recievePassword(recievePasswordRequest: event.request);

        if(response is Success){
          var data = response.data  as SendSmsCodeResponse;
          emit(RecievePasswordSuccess(sendSmsCodeResponse:data ));

        }
        else if( response is Error) {
          emit(RecievePasswordFailure(error: response.errorMessage));
        }

      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(RecievePasswordFailure(error: error.toString()));
      }

    });
  }
}
