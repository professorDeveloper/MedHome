import 'package:get_it/get_it.dart';
import 'package:medhome/blocs/forget/forget_verfy_bloc.dart';
import 'package:medhome/blocs/home/profile/profile_bloc.dart';
import 'package:medhome/blocs/login/login_bloc.dart';
import 'package:medhome/blocs/register/register_bloc.dart';
import 'package:medhome/blocs/register/send_sms_code_bloc.dart';
import 'package:medhome/blocs/verify/verify_bloc.dart';
import 'package:medhome/core/api/auth_api_impl.dart';
import 'package:medhome/core/api/profile_api_impl.dart';

import '../../blocs/forget/recieve_password_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  //Repositories
  serviceLocator.registerLazySingleton(() => ProfileBloc());
  serviceLocator.registerLazySingleton(() => ProfileApiImp());
  serviceLocator.registerLazySingleton(() => AuthApiImpl());
  serviceLocator.registerLazySingleton(() => LoginBloc());
  serviceLocator.registerLazySingleton(() => VerifyBloc());
  serviceLocator.registerLazySingleton(() => RegisterBloc());
  serviceLocator.registerLazySingleton(() => SendSmsCodeBloc());
  serviceLocator.registerLazySingleton(() => ForgetVerfyBloc());
  serviceLocator.registerLazySingleton(() => RecievePasswordBloc());
}
