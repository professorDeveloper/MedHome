part of 'recieve_password_bloc.dart';

@immutable
abstract class RecievePasswordInitEvent {}
 class RecievePasswordEvent extends RecievePasswordInitEvent {
  RecievePasswordRequest request;

  RecievePasswordEvent({required this.request});
}
