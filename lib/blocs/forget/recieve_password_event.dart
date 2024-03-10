part of 'recieve_password_bloc.dart';

@immutable
abstract class RecievePasswordInitEvent {}
abstract class RecievePasswordEvent {
  RecievePasswordRequest request;

  RecievePasswordEvent({required this.request});
}
