import 'package:get_it/get_it.dart';
import 'package:medhome/blocs/login/login_bloc.dart';
import 'package:medhome/blocs/register/send_sms_code_bloc.dart';
import 'package:medhome/core/api/auth_api.dart';
import 'package:medhome/core/api/auth_api_impl.dart';
import 'package:medhome/utils/my_pref.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  //Repositories
  serviceLocator.registerLazySingleton(() => AuthApiImpl());
  serviceLocator.registerLazySingleton(() => LoginBloc());
  serviceLocator.registerLazySingleton(() => SendSmsCodeBloc());


}