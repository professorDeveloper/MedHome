part of 'verify_bloc.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}

class VerifyLoading extends VerifyState {}

class VerifySuccess extends VerifyState {
 final SendSmsCodeResponse sendSmsCodeResponse;

 VerifySuccess({required this.sendSmsCodeResponse});
}

class VerifyFailure extends VerifyState {
  final String error;

  VerifyFailure({required this.error});}
