import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhome/core/models/request/verify/verify_request.dart';

import '../../core/api/auth_api_impl.dart';
import '../../core/di/get_it.dart';
import '../../core/models/response/auth/send_sms_code_response.dart';
import '../../utils/response.dart';

part 'verify_event.dart';

part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final AuthApiImpl authApi = serviceLocator<AuthApiImpl>();

  VerifyBloc() : super(VerifyInitial()) {
    on<VerifyButtonPressed>((event, emit) async {
      emit(VerifyLoading());

      try {
        final response = await authApi.verify(
            request: VerifyRequest(code: event.code, phone: event.phone));
        if (response is Success) {
          emit(VerifySuccess());
        } else if (response is Error) {
          emit(VerifyFailure(error: response.errorMessage.toString()));
        }
      } catch (e) {
        emit(VerifyFailure(error: e.toString()));
      }
    });
  }
}
