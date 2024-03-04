import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../core/api/auth_api_impl.dart';
import '../../core/models/request/auth/login_request.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthApiImpl authApi;

  LoginBloc({required this.authApi}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.login(loginRequest: LoginRequest(phone: event.phone, password: event.password));

        if(response.access!=null){
          emit(LoginSuccess(sucsess: response.access!));
        }
        else{
          emit(LoginFailure(error: "Serverda hatolik bo`ldi"));
        }

      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
}
