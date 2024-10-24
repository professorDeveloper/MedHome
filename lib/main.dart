import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhome/blocs/forget/forget_verfy_bloc.dart';
import 'package:medhome/blocs/home/profile/profile_bloc.dart';
import 'package:medhome/blocs/register/send_sms_code_bloc.dart';
import 'package:medhome/blocs/verify/verify_bloc.dart';
import 'package:medhome/core/di/get_it.dart';
import 'package:medhome/regiser_screen.dart';
import 'package:medhome/screens/login/login_screen.dart';
import 'package:medhome/screens/main/main_screen.dart';
import 'package:medhome/screens/onboarding/introduction_screen.dart';
import 'package:medhome/screens/order/order_history_screen.dart';
import 'package:medhome/screens/profile/profile_screen.dart';
import 'package:medhome/screens/register/register_screen.dart';
import 'package:medhome/utils/my_pref.dart';

import 'blocs/forget/recieve_password_bloc.dart';
import 'blocs/login/login_bloc.dart';
import 'blocs/register/register_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:init(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? token = snapshot.data as String? ;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<ProfileBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<LoginBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<SendSmsCodeBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<RegisterBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<ForgetVerfyBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<RecievePasswordBloc>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<VerifyBloc>(),
              ),
            ],
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  title: 'Med Home',
                  debugShowCheckedModeBanner: false,
                  // supportedLocales: L10n.all,
                  // locale: locale,
                  // localizationsDelegates: [
                  //   AppLocalizations.delegate,
                  //   GlobalMaterialLocalizations.delegate,
                  //   GlobalCupertinoLocalizations.delegate,
                  //   GlobalWidgetsLocalizations.delegate
                  // ],
                  darkTheme: ThemeData(

                  ),
                  theme: ThemeData(
                    cardTheme: CardTheme(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                    ),

                    cardColor: Colors.white,
                    useMaterial3: true,
                    primarySwatch: Colors.red,
                  ),
                  home: token != null && token.isNotEmpty
                      ? const MainScreen()
                      : const IntroductionScreen(),
                );
              },
            ),
          );
        }
        else {
          return CircularProgressIndicator();
        }
      });
  }
}
Future<String?> init() async {
  await Prefs.init();

  return Prefs.getAccessToken();
}
