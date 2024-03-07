import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:medhome/core/di/get_it.dart';
import 'package:medhome/core/models/response/auth/login_response.dart';
import 'package:medhome/utils/response.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../core/api/auth_api_impl.dart';
import '../../core/models/request/auth/login_request.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthApiImpl authApi=serviceLocator<AuthApiImpl>();


  LoginBloc(): super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.login(loginRequest: LoginRequest(phone: event.phone, password: event.password));

        if(response is Success){
          var data = response.data  as LoginResponse;
          emit(LoginSuccess(sucsess:data ));

        }
        else if( response is Error) {
          emit(LoginFailure(error: response.errorMessage));
        }

      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
