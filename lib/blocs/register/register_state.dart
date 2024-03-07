part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterResponse response;

  RegisterSuccess({required this.response});
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});
}
