import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medhome/core/api/profile_api_impl.dart';
import 'package:medhome/core/models/response/home/profile_response.dart';
import 'package:meta/meta.dart';

import '../../../core/di/get_it.dart';
import '../../../utils/response.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileApiImp authApi = serviceLocator<ProfileApiImp>();

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
    });
    on<GetProfileEvent>((event, emit) async{
      emit(ProfileLoading());

      try {
        // Use your AuthApiImpl for login logic
        final response = await authApi.getProfile();


        if (response is Success) {
          var data = response.data as ProfileResponse;
          emit(ProfileSuccess(sucsess: data));
        } else if (response is Error) {
          emit(ProfileFailure(error: response.errorMessage));
        }
      } catch (error) {
        // Handle other types of exceptions, e.g., network errors
        emit(ProfileFailure(error: error.toString()));
      }
    });
  }
}
