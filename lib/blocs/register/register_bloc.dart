import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medhome/core/models/response/auth/register_response.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
    });
  }
}
