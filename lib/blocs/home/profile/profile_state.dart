part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileInitial {}

class ProfileSuccess extends ProfileInitial {
  final ProfileResponse sucsess;

  ProfileSuccess({required this.sucsess});
}

class ProfileFailure extends ProfileInitial {
  final String error;

  ProfileFailure({required this.error});
}